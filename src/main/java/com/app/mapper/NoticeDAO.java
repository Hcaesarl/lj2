package com.app.mapper;

import com.app.entity.Ck;
import com.app.entity.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeDAO {

    public void save(String title, String userId);

    public List<Notice> searchByUser(String userId);

    public void delete(String title, String userId);

}
