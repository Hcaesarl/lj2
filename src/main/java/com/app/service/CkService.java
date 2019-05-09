package com.app.service;
import java.util.List;

import com.app.entity.Ordertab;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Ck;
public interface CkService {
    public List<Ck> getCkPager(@Param("skip") int skip, @Param("size") int size);
    public  Ck getCkById(int id);   
    public int getCkCount();   
    public int insert(Ck entity);   
    public int delete(int id);   
    public int update(Ck entity);
	public List<Ck> getAllCk();
    public List<Ck> searchByStores(String id);


}
