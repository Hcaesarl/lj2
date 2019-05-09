package com.app.service;

import com.app.entity.Level;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface LevelServie {
    public void addLevel(Integer num, String userId, String remark);

    public List<Level> searchByUser(String userId);


}
