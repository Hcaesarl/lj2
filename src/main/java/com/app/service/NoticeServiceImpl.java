package com.app.service;


import com.app.entity.Notice;
import com.app.mapper.NoticeDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    NoticeDAO noticeDAO;


    @Override
    public void save(String title, String userId) {
        noticeDAO.save(title, userId);
    }

    @Override
    public List<Notice> searchByUser(String userId) {
        List<Notice> notices = noticeDAO.searchByUser(userId);
        return notices;
    }

    @Override
    public void delete(String name, String userId) {
        noticeDAO.delete(name, userId);
    }


}
