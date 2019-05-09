package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Message;
import com.app.mapper.MessageDAO;
@Service
public class MessageServiceImpl implements MessageService{
	@Resource MessageDAO messageDao;
public List<Message> getMessagePager(@Param("skip") int skip,@Param("size") int size){
return messageDao.getMessagePager(skip, size);
}
public  Message getMessageById(int id){
return messageDao.getMessageById(id);
}
public int getMessageCount(){
return messageDao.getMessageCount();
}
public int insert(Message entity){
return messageDao.insert(entity);
}
public int delete(int id){
return messageDao.delete(id);
}
public int update(Message entity){
return messageDao.update(entity);
}
public List<Message> getAllMessage(){
return messageDao.getAllMessage();
}

}
