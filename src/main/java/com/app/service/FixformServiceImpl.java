package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Fixform;
import com.app.mapper.FixformDAO;
@Service
public class FixformServiceImpl implements FixformService{
	@Resource FixformDAO fixformDao;
public List<Fixform> getFixformPager(@Param("skip") int skip,@Param("size") int size){
return fixformDao.getFixformPager(skip, size);
}
public  Fixform getFixformById(int id){
return fixformDao.getFixformById(id);
}
public int getFixformCount(){
return fixformDao.getFixformCount();
}
public int insert(Fixform entity){
return fixformDao.insert(entity);
}
public int delete(int id){
return fixformDao.delete(id);
}
public int update(Fixform entity){
return fixformDao.update(entity);
}
public List<Fixform> getAllFixform(){
return fixformDao.getAllFixform();
}

}
