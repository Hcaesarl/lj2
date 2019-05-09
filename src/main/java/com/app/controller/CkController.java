package com.app.controller;

import com.app.entity.Ck;
import com.app.entity.Ordertab;
import com.app.entity.Stores;
import com.app.entity.Users;
import com.app.service.CkService;
import com.app.service.StoresService;
import com.app.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ck")
public class CkController {
    @Resource
    CkService ckService;

    @Resource
    UsersService usersService;

    @RequestMapping("/ck/add")
    public String ckAdd() {
        return "admin/ck/add";
    }

    @RequestMapping(value = "/ck/save", method = RequestMethod.POST)
    public String ckSave(String title,
                         String description,
                         String created,
                         Model model) {
        Ck modelX = new Ck();
        modelX.setTitle(title);
        modelX.setDescription(description);
        modelX.setCreated(created);

        ckService.insert(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("message", "Success!");
        return "admin/ck/add";
    }

    @RequestMapping("/ck/delete/{id}")
    @ResponseBody
    public String ckDelete(@PathVariable Integer id) {
        ckService.delete(id);
        return "success";
    }


    @RequestMapping("/ck/delete2")
    public String ckDelete2(int id) {
        Stores m = storesService.getStoresById(id);
        storesService.delete(id);

        return "redirect:list?id=" + m.getPid();
    }


    @RequestMapping(value = "/ck/addst", method = RequestMethod.POST)
    public String addst(String pid,
                        String sid,
                        String num,
                        Model model) {
        Stores modelX = new Stores();
        modelX.setPid(pid);
        modelX.setSid(sid);
        modelX.setNum(num);

        //删除此商品在此仓库的库存
        storesService.deleteByCkId(pid, sid);

        storesService.insert(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("message", "Success!");
        return "redirect:list?id=" + pid;
    }

    @Resource
    StoresService storesService;

    @RequestMapping("/ck/list")
    public ModelAndView ckList(Integer id) {
        List<Ck> ckList = ckService.getAllCk();
        ModelAndView mav = new ModelAndView("admin/ck/list");
        mav.addObject("list", ckList);
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping("/ck/edit")
    public String ckEdit(String id, Model model) {
        Ck ck = ckService.getCkById(Integer.parseInt(id));
        model.addAttribute("model", ck);
        return "admin/ck/edit";
    }

    @RequestMapping(value = "/ck/update", method = RequestMethod.POST)
    public String ckUpdate(String title,
                           String description,
                           String created,
                           int id,
                           Model model) {

        Ck modelX = ckService.getCkById(id);
        modelX.setTitle(title);
        modelX.setDescription(description);
        modelX.setCreated(created);

        ckService.update(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("model", modelX);
        model.addAttribute("message", "Success");
        return "admin/ck/edit";
    }

    @RequestMapping("/searchByStores/{id}")
    @ResponseBody
    public Map searchByStores(@PathVariable String id, HttpServletRequest request) {
        List<Ck> ckList = ckService.searchByStores(id);
        List<Users> users = usersService.searchDelivery();
        if (ckList.size() > 0) {
            Map map = new HashMap();
            map.put("ckList", ckList);
            map.put("delivery", users);
            return map;
        }
        return null;
    }


    @RequestMapping("/search/all")
    public ModelAndView toCkList(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/ck/allList");
        return modelAndView;
    }

    /**
     * 仓库列表
     * @param request
     * @return
     */
    @RequestMapping("/search/list")
    @ResponseBody
    public List<Ck> searchAllCk(HttpServletRequest request) {
        List<Ck> ckList = ckService.getAllCk();
        return ckList;
    }

    /**
     * 增加仓库
     */
    @RequestMapping("/ck/addCk")
    @ResponseBody
    public String addCk(Ck ck, HttpServletRequest request) {
        String userid = request.getSession().getAttribute("userid")+"";
        ck.setCreated(userid);
        ckService.insert(ck);
        return "success";
    }

    /**
     * 更新仓库
     */
    @RequestMapping("/ck/updateCk")
    @ResponseBody
    public String updateCk(Ck ck, HttpServletRequest request) {
        ckService.update(ck);
        return "success";
    }
}
