package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

public interface CkDAO {
    public List<Ck> getCkPager(@Param("skip") int skip, @Param("size") int size);

    public Ck getCkById(int id);

    public int getCkCount();

    public int insert(Ck entity);

    public int delete(int id);

    public int update(Ck entity);

    public List<Ck> getAllCk();

    public List<Ck> searchByStores(String id);

}
