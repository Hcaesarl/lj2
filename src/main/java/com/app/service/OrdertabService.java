package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Ordertab;
public interface OrdertabService {
    public List<Ordertab> getOrdertabPager(@Param("skip") int skip, @Param("size") int size);
    public  Ordertab getOrdertabById(int id);   
    public int getOrdertabCount();   
    public int insert(Ordertab entity);   
    public int delete(int id);   
    public int update(Ordertab entity);
	public List<Ordertab> getAllOrdertab(String type,String userId);

    public void updateStatusById(String id, String ckId, String delivery);
    public void updateTruck(String id, String truckId);
    public void sign(String id);

}
