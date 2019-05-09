package com.app.service;

import com.app.entity.Level;
import com.app.mapper.LevelDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class LevelServieImpl implements LevelServie {

    @Resource
    LevelDAO levelDAO;

    @Override
    public void addLevel(Integer num, String userId, String remark) {
        Date date = new Date();
        levelDAO.addLevel(num, userId,remark,date);
    }

    @Override
    public List<Level> searchByUser(String userId) {
        return levelDAO.searchByUser(userId);
    }
}
