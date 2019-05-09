package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
public interface FixformDAO {
    public List<Fixform> getFixformPager(@Param("skip") int skip, @Param("size") int size);
    public  Fixform getFixformById(int id);   
    public int getFixformCount();   
    public int insert(Fixform entity);   
    public int delete(int id);   
    public int update(Fixform entity);
	public List<Fixform> getAllFixform();
}
