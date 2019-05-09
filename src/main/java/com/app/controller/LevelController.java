package com.app.controller;

import com.app.entity.Level;
import com.app.entity.Users;
import com.app.service.LevelServie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/level")
public class LevelController {


    @Resource
    LevelServie levelServie;


    @RequestMapping(value = "/add/{userId}/{num}", method = RequestMethod.GET)
    @ResponseBody
    public void addLevel(@PathVariable Integer num, @PathVariable String userId,String remark) {
        levelServie.addLevel(num,userId,remark);
    }

    @RequestMapping("/list")
    public ModelAndView usersList() {
        ModelAndView mav = new ModelAndView("admin/level/list");
        return mav;
    }

    @RequestMapping(value = "/searchByUser",method = RequestMethod.GET)
    @ResponseBody
    public List<Level> searchByUser(HttpSession session) {
        String userId = session.getAttribute("userid") + "";
        List<Level> levels = levelServie.searchByUser(userId);
        return levelServie.searchByUser(userId);
    }

}
