package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Goods;
public interface GoodsService {
    public List<Goods> getGoodsPager(@Param("skip") int skip, @Param("size") int size);
    public  Goods getGoodsById(int id);   
    public int getGoodsCount();   
    public int insert(Goods entity);
    public int delete(int id);   
    public int update(Goods entity);
	public List<Goods> getAllGoods();
	public List<Goods> alllist();
	public List<Goods> searchReview();
    public List<Goods> searchByName(String name);
    public List<Goods> searchMylist(String id);

    public void changeReview(String id, String type);
}
