package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
public interface MessageDAO {
    public List<Message> getMessagePager(@Param("skip") int skip, @Param("size") int size);
    public  Message getMessageById(int id);   
    public int getMessageCount();   
    public int insert(Message entity);   
    public int delete(int id);   
    public int update(Message entity);
	public List<Message> getAllMessage();
}
