package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
public interface NewsDAO {
    public List<News> getNewsPager(@Param("skip") int skip, @Param("size") int size);
    public  News getNewsById(int id);   
    public int getNewsCount();   
    public int insert(News entity);   
    public int delete(int id);   
    public int update(News entity);
	public List<News> getAllNews();
}
