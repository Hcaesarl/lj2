package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Ordertab;
import com.app.mapper.OrdertabDAO;
@Service
public class OrdertabServiceImpl implements OrdertabService{
	@Resource OrdertabDAO ordertabDao;
public List<Ordertab> getOrdertabPager(@Param("skip") int skip,@Param("size") int size){
return ordertabDao.getOrdertabPager(skip, size);
}
public  Ordertab getOrdertabById(int id){
return ordertabDao.getOrdertabById(id);
}
public int getOrdertabCount(){
return ordertabDao.getOrdertabCount();
}
public int insert(Ordertab entity){
return ordertabDao.insert(entity);
}
public int delete(int id){
return ordertabDao.delete(id);
}
public int update(Ordertab entity){
return ordertabDao.update(entity);
}
public List<Ordertab> getAllOrdertab(String type,String userId){
return ordertabDao.getAllOrdertab(type,userId);
}

	@Override
	public void updateStatusById(String id,String ckId,String delivery) {
		ordertabDao.updateStatusById(id,ckId,delivery);
	}

	@Override
	public void updateTruck(String id, String truckId) {
		ordertabDao.updateTruck(id, truckId);
	}

	public void sign(String id) {
		ordertabDao.sign(id);
	}
}
