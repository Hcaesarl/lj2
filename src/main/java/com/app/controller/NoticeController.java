package com.app.controller;

import com.app.entity.Goods;
import com.app.entity.Notice;
import com.app.service.GoodsService;
import com.app.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    NoticeService noticeService;

    @Resource
    GoodsService goodsService;

    @RequestMapping("/save/{title}")
    @ResponseBody
    public void save(@PathVariable String title, HttpSession session) {
        String userid = session.getAttribute("userid") + "";
        noticeService.save(title,userid);
    }

    @RequestMapping("/searchByUser")
    @ResponseBody
    public List<Notice> searchByUser(HttpSession session) {
        String userid = session.getAttribute("userid") + "";
        List<Notice> notices = noticeService.searchByUser(userid);
        List<Notice> list = new ArrayList();
        for (Notice item : notices
        ) {
            List<Goods> goods = goodsService.searchByName(item.getTitle());
            if (goods.size() > 0) {
                list.add(item);
            }
        }
        return list;
    }

}
