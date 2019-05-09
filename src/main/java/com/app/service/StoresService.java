package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Stores;
public interface StoresService {
    public List<Stores> getStoresPager(@Param("skip") int skip, @Param("size") int size);
    public  Stores getStoresById(int id);   
    public int getStoresCount();   
    public int insert(Stores entity);   
    public int delete(int id);   
    public int update(Stores entity);
	public List<Stores> getAllStores();public List<Stores> getStores(int pid);

    public void deleteByCk(Integer ckId);
    public void deleteByCkId(String id,String ckId);

}
