package com.app.mapper;

import com.app.entity.Level;

import java.util.Date;
import java.util.List;

public interface LevelDAO {

    public void addLevel(Integer num, String userId, String remark, Date date);

    public List<Level> searchByUser(String userId);
}
