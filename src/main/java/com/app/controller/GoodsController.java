package com.app.controller;

import com.app.entity.Goods;
import com.app.mapper.NoticeDAO;
import com.app.service.*;
import com.app.utils.MainUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    GoodsService goodsService;
    @Resource
    InfocateService cateService;
    @Resource
    UsersService usersService;
    @Resource
    InfocateService cService;
    @Resource
    LevelServie levelServie;
    @Resource
    NoticeService noticeService;

    @RequestMapping("/goods/add")
    public String goodsAdd(Model model) {
        model.addAttribute("list", cateService.getByType(1));
        return "admin/goods/add";
    }

    @RequestMapping(value = "/goods/save", method = RequestMethod.POST)
    public String goodsSave(Goods goods, Model model, HttpSession session) {
        goods.setUid(session.getAttribute("userid") + "");
        goods.setStore("0");
        goods.setCreated(MainUtils.getTime());
        //默认为未审核状态
        goods.setIsReview("N");
        goodsService.insert(goods);
        model.addAttribute("inpost", true);
        model.addAttribute("message", "发布物品成功!");
        //增加发布者等级
        levelServie.addLevel(1, session.getAttribute("userid") + "","发布货品");
        return "admin/goods/add";
    }

    @RequestMapping("/goods/delete")
    public String goodsDelete(int id) {
        goodsService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("/goods/list")
    public ModelAndView goodsList() {
        ModelAndView mav = new ModelAndView("admin/goods/list");
        return mav;
    }

    @RequestMapping(path = "/goods/searchAll")
    @ResponseBody
    public List<Goods> searchAll(HttpServletRequest request) {
        List<Goods> goodsList = goodsService.getAllGoods();

        for (Goods goods : goodsList) {
            goods.setC(cateService.getInfocateById(goods.getId()));
            goods.setU(usersService.getUsersById(Integer.parseInt(goods.getUid().toString())));
        }
        return goodsList;
    }

    @RequestMapping(path = "/goods/allList")
    @ResponseBody
    public List<Goods> allList(HttpServletRequest request) {
        List<Goods> goodsList = goodsService.alllist();

        for (Goods goods : goodsList) {
            goods.setC(cateService.getInfocateById(goods.getId()));
            goods.setU(usersService.getUsersById(Integer.parseInt(goods.getUid().toString())));
        }
        return goodsList;
    }

    @RequestMapping("/goods/mylist")
    public ModelAndView mylist(HttpSession session) {
        String uid = session.getAttribute("userid") + "";
        List<Goods> goodsList = goodsService.getAllGoods();
        List<Goods> goodsList1 = new LinkedList<Goods>();
        if (goodsList.size() > 0) {
            for (Goods g : goodsList) {
                if (uid.equals(g.getUid()))
                    goodsList1.add(g);
            }
        }


        System.out.println(goodsList.size());
        ModelAndView mav = new ModelAndView("admin/goods/selflist");
        mav.addObject("list", goodsList1);
        return mav;
    }

    /**
     * 查询我发布的商品
     * @param session
     * @return
     */
    @RequestMapping(path = "/goods/searchByCreat")
    @ResponseBody
    public List<Goods> searchByCreat(HttpSession session) {
        String uid = session.getAttribute("userid") + "";
        List<Goods> goodsList = goodsService.searchMylist(uid);
        List<Goods> goodsList1 = new LinkedList<Goods>();
        if (goodsList.size() > 0) {
            for (Goods g : goodsList) {
                if (uid.equals(g.getUid()))
                    goodsList1.add(g);
            }
        }
        return goodsList;
    }

    @RequestMapping("/goods/edit")
    public String goodsEdit(String id, Model model) {
        Goods goods = goodsService.getGoodsById(Integer.parseInt(id));
        model.addAttribute("model", goods);
        return "admin/goods/edit";
    }

    @RequestMapping(value = "/goods/update", method = RequestMethod.POST)
    public String goodsUpdate(String uid,
                              String code,
                              String product_name,
                              String description,
                              String thumb,
                              String content,
                              String category_name,
                              String click,
                              String category,
                              String store,
                              String vpath,
                              String price,
                              String created,
                              String updated,
                              String status,
                              int id,
                              Model model) {

        Goods modelX = goodsService.getGoodsById(id);

        modelX.setProduct_name(product_name);
        modelX.setDescription(description);
        modelX.setThumb(thumb);
        modelX.setContent(content);
        modelX.setPrice(price);

        goodsService.update(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("model", modelX);
        model.addAttribute("message", "更新产品成功");
        return "admin/goods/edit";
    }

    /**
     * 前往搜索商品页面
     *
     * @param name
     * @param request
     * @return
     */
    @RequestMapping(path = "/searchView")
    public ModelAndView searchNameView(String name, HttpServletRequest request,String delete) {
        String uid = request.getSession().getAttribute("userid") + "";

        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goods = goodsService.searchByName(name);
        String isNO = "Y";

        //若结果为空，则返回isNo
        if (goods.size() > 0) {
            isNO = "N";
        }
        //如果delete不为Null，则此次访问由关注消息发起，点击后删除关注记录
        if (delete != null) {
            noticeService.delete(name, uid);
        }
        modelAndView.setViewName("admin/goods/searchGoods");
        modelAndView.addObject("goodsName", name);
        modelAndView.addObject("isNo", isNO);
        modelAndView.addObject("clist",cService.getByType(2));
        modelAndView.addObject("clist1",cService.getByType(1));
        return modelAndView;

    }

    /**
     * 根据名称模糊搜索商品
     *
     * @param goodsName
     * @param request
     * @return
     */
    @RequestMapping(path = "/searchByName/{goodsName}", method = RequestMethod.GET)
    @ResponseBody
    public List<Goods> searchByName(@PathVariable String goodsName, HttpServletRequest request) {
        List<Goods> goods = goodsService.searchByName(goodsName);
        if (goods.size() > 0) {
            for (Goods item : goods) {
                item.setC(cateService.getInfocateById(item.getId()));
                item.setU(usersService.getUsersById(Integer.parseInt(item.getUid().toString())));
            }
            return goods;
        }
        return null;
    }

    @RequestMapping("/three/{id}")
    public ModelAndView toThree(@PathVariable String id) {
        Goods goods = goodsService.getGoodsById(Integer.parseInt(id));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/goods/3D");
        modelAndView.addObject("vpath", goods.getVpath());
        return modelAndView;
    }

    @RequestMapping("/goods/review")
    public ModelAndView toReview(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/goods/exlist");
        return modelAndView;
    }
    @RequestMapping("/goods/searchReview")
    @ResponseBody
    public List<Goods> searchReview(HttpServletRequest request) {
        List<Goods> goodsList = goodsService.searchReview();

        for (Goods goods : goodsList) {
            goods.setC(cateService.getInfocateById(goods.getId()));
            goods.setU(usersService.getUsersById(Integer.parseInt(goods.getUid().toString())));
        }
        return goodsList;
    }

    @RequestMapping("/goods/changeReview/{id}/{type}")
    @ResponseBody
    public String changeReview(@PathVariable String id, @PathVariable String type) {
        goodsService.changeReview(id, type);
        return "success";
    }



}
