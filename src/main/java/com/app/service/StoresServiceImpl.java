package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Stores;
import com.app.mapper.StoresDAO;
@Service
public class StoresServiceImpl implements StoresService{
	@Resource StoresDAO storesDao;
public List<Stores> getStoresPager(@Param("skip") int skip,@Param("size") int size){
return storesDao.getStoresPager(skip, size);
}
public  Stores getStoresById(int id){
return storesDao.getStoresById(id);
}
public int getStoresCount(){
return storesDao.getStoresCount();
}
public int insert(Stores entity){
return storesDao.insert(entity);
}
public int delete(int id){
return storesDao.delete(id);
}
public int update(Stores entity){
return storesDao.update(entity);
}
public List<Stores> getAllStores(){
return storesDao.getAllStores();
}
public List<Stores> getStores(int pid) {
	// TODO Auto-generated method stub
	return storesDao.getStores(pid);
}

	@Override
	public void deleteByCk(Integer ckId) {
		storesDao.deleteByCk(ckId);
	}

	@Override
	public void deleteByCkId(String id,String ckId) {
		storesDao.deleteByCkId(id,ckId);
	}



}
