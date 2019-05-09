package com.app.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;

@Controller
@RequestMapping("/ordertab")
public class OrdertabController {
    @Resource
    OrdertabService ordertabService;

    @Resource
    LevelServie levelServie;

    @RequestMapping("/ordertab/add")
    public String ordertabAdd() {
        return "admin/ordertab/add";
    }

    @RequestMapping(value = "/ordertab/save", method = RequestMethod.POST)
    public String ordertabSave(Ordertab ordertab, Model model) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ordertab.setCreated(format.format(new Date()));

        ordertabService.insert(ordertab);
        model.addAttribute("inpost", true);
        model.addAttribute("message", "Success!");
        return "admin/ordertab/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(Ordertab ordertab, Model model, HttpServletRequest request) {
        String userid = request.getSession().getAttribute("userid")+"";
        ordertab.setUid(userid);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ordertab.setCreated(format.format(new Date()));
        ordertab.setStatus("N");
        ordertabService.insert(ordertab);
        return "success";
    }

    @RequestMapping("/ordertab/delete")
    public String ordertabDelete(int id) {
        ordertabService.delete(id);
        return "redirect:list";
    }


    @Resource
    GoodsService goodsService;
    @Resource
    UsersService usersService;

    @RequestMapping("/ordertab/list")
    public ModelAndView ordertabList() {
        ModelAndView mav = new ModelAndView("admin/ordertab/list");
        return mav;
    }

    @RequestMapping(path = "/searchAll")
    @ResponseBody
    public List<Ordertab> searchAll(String type,HttpServletRequest request) {
        String userid = request.getSession().getAttribute("userid") + "";
        List<Ordertab> ordertabList = ordertabService.getAllOrdertab(type,userid);

        for (Ordertab ordertab : ordertabList) {
            ordertab.setBuy(usersService.getUsersById(Integer.parseInt(ordertab.getUid())));
            ordertab.setSaler(usersService.getUsersById(Integer.parseInt(ordertab.getCuid())));
            ordertab.setGd(goodsService.getGoodsById(Integer.parseInt(ordertab.getPid())));
        }
        return ordertabList;
    }

    @RequestMapping("/ordertab/selflist")
    public ModelAndView ordertabList1(HttpSession session) {
        ModelAndView mav = new ModelAndView("admin/ordertab/selflist");
        return mav;
    }
    @RequestMapping("/ordertab/delivery")
    public ModelAndView ordertabList2(HttpSession session) {
        ModelAndView mav = new ModelAndView("admin/ordertab/deliverylist");
        return mav;
    }

    @RequestMapping("/ordertab/edit")
    public String ordertabEdit(String id, Model model) {
        Ordertab ordertab = ordertabService.getOrdertabById(Integer.parseInt(id));
        model.addAttribute("model", ordertab);
        return "admin/ordertab/edit";
    }

    @RequestMapping(value = "/ordertab/update", method = RequestMethod.POST)
    public String ordertabUpdate(String order_id,
                                 String price,
                                 String total,
                                 String uid,
                                 String pid,
                                 String cuid,
                                 String num,
                                 String content,
                                 String step,
                                 String updated,
                                 String created,
                                 String status,
                                 String buyer,
                                 String pname,
                                 int id,
                                 Model model) {

        Ordertab modelX = ordertabService.getOrdertabById(id);
        modelX.setOrder_id(order_id);
        modelX.setPrice(price);
        modelX.setTotal(total);
        modelX.setUid(uid);
        modelX.setPid(pid);
        modelX.setCuid(cuid);
        modelX.setNum(num);
        modelX.setContent(content);
        modelX.setStep(step);
        modelX.setUpdated(updated);
        modelX.setCreated(created);
        modelX.setStatus(status);
        modelX.setBuyer(buyer);
        modelX.setPname(pname);

        ordertabService.update(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("model", modelX);
        model.addAttribute("message", "Success");
        return "admin/ordertab/edit";
    }

    /**
     * 指定订单的配送仓库以及配送人员，将订单转台改为已发货
     * @param storesId
     * @param ckId
     * @param delivery
     */
    @RequestMapping("/updateStatusById/{storesId}/{ckId}/{delivery}")
    @ResponseBody
    public void updateStatusById(@PathVariable String storesId, @PathVariable String ckId,@PathVariable String delivery) {
        ordertabService.updateStatusById(storesId, ckId, delivery);
    }

    /**
     * 指定订单的配送车辆，将订单转台改为配送站
     * @param storesId
     * @param truckId
     */
    @RequestMapping("/updateTruck/{storesId}/{truckId}")
    @ResponseBody
    public void updateTruck(@PathVariable String storesId, @PathVariable String truckId) {
        ordertabService.updateTruck(storesId, truckId);
    }


    /**
     * 签收
     *
     * @param storesId
     */
    @RequestMapping("/sign/{storesId}/{cuId}/{num}")
    @ResponseBody
    public void sign(@PathVariable String storesId, @PathVariable String cuId, @PathVariable Integer num, HttpSession session) {

        ordertabService.sign(storesId);
//        增加客户等级
        levelServie.addLevel(1, session.getAttribute("userid") + "","签收货品");
        //根据评价给上传者增加等级
        levelServie.addLevel(num, cuId,"买家评价");
    }


    /**
     * 导出安全协议
     *
     * @param request
     */
    @RequestMapping("/output1")
    public ResponseEntity<byte[]> download(HttpServletRequest request,
                                           Model model)throws Exception {
        //下载文件路径
        String path = request.getServletContext().getRealPath("/file/file.xlsx");
        File file = new File(path);
        HttpHeaders headers = new HttpHeaders();

        //下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String("file.xlsx".getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    /**
     * 导出安全协议
     *
     * @param request
     */
    @RequestMapping("/output/{id}")
    public ResponseEntity<byte[]> downloadMe(HttpServletRequest request,@PathVariable String id) throws Exception {

        Ordertab ordertab = ordertabService.getOrdertabById(Integer.parseInt(id));
        Goods goods = goodsService.getGoodsById(Integer.parseInt(ordertab.getPid()));


//        读取文件
        ExcelReader reader = ExcelUtil.getReader("../file/file.xlsx");

//        获取sheet
        Sheet sheet = reader.getWorkbook().getSheetAt(0);

        sheet.getRow(3).getCell(1).setCellValue(ordertab.getCode());
        sheet.getRow(4).getCell(1).setCellValue(goods.getProduct_name());
        sheet.getRow(5).getCell(1).setCellValue(ordertab.getTel());

        ExcelWriter writer = reader.getWriter();
        File file = new File("../file/file1.xlsx");
        writer.setDestFile(file);
        writer.flush();


        HttpHeaders headers = new HttpHeaders();
        String fileName = ordertab.getCode() + ".xlsx";
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(fileName.getBytes("UTF-8"), "UTF-8");

        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);

    }

}
