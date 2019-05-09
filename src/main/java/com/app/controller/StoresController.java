package com.app.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;

@Controller
@RequestMapping("/stores")
public class StoresController {
    @Resource
    StoresService storesService;

    @Resource
    CkService ckService;

    @RequestMapping("/stores/add")
    public String storesAdd() {
        return "admin/stores/add";
    }

    @RequestMapping(value = "/stores/save", method = RequestMethod.POST)
    public String storesSave(String pid,
                             String sid,
                             String num,
                             Model model) {
        Stores modelX = new Stores();
        modelX.setPid(pid);
        modelX.setSid(sid);
        modelX.setNum(num);

        storesService.insert(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("message", "Success!");
        return "admin/stores/add";
    }

    @RequestMapping("/stores/delete")
    public String storesDelete(int id) {
        storesService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("/stores/list")
    public ModelAndView storesList() {
        List<Stores> storesList = storesService.getAllStores();
        System.out.println(storesList.size());
        ModelAndView mav = new ModelAndView("admin/stores/list");
        mav.addObject("list", storesList);
        return mav;
    }

    @RequestMapping("/stores/edit")
    public String storesEdit(String id, Model model) {
        Stores stores = storesService.getStoresById(Integer.parseInt(id));
        model.addAttribute("model", stores);
        return "admin/stores/edit";
    }

    @RequestMapping(value = "/stores/update", method = RequestMethod.POST)
    public String storesUpdate(String pid,
                               String sid,
                               String num,
                               int id,
                               Model model) {

        Stores modelX = storesService.getStoresById(id);
        modelX.setPid(pid);
        modelX.setSid(sid);
        modelX.setNum(num);

        storesService.update(modelX);
        model.addAttribute("inpost", true);
        model.addAttribute("model", modelX);
        model.addAttribute("message", "Success");
        return "admin/stores/edit";
    }

    @RequestMapping(path = "/searchStoresById/{id}")
    @ResponseBody
    public List<Stores> searchStoresById(@PathVariable Integer id, HttpServletRequest request) {
        List<Stores> list = storesService.getStores(id);
        for (Stores stores : list) {
            stores.setCk(ckService.getCkById(Integer.parseInt(stores.getSid())));
        }
        return list;
    }


}
