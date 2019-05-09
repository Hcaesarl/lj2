package com.app.service;
import java.util.List;
import javax.annotation.Resource;

import com.app.entity.Ordertab;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Ck;
import com.app.mapper.CkDAO;
@Service
public class CkServiceImpl implements CkService{
	@Resource CkDAO ckDao;
public List<Ck> getCkPager(@Param("skip") int skip,@Param("size") int size){
return ckDao.getCkPager(skip, size);
}
public  Ck getCkById(int id){
return ckDao.getCkById(id);
}
public int getCkCount(){
return ckDao.getCkCount();
}
public int insert(Ck entity){
return ckDao.insert(entity);
}
public int delete(int id){
return ckDao.delete(id);
}
public int update(Ck entity){
return ckDao.update(entity);
}
public List<Ck> getAllCk(){
return ckDao.getAllCk();
}
	@Override
	public List<Ck> searchByStores(String id) {
		return ckDao.searchByStores(id);
	}

}
