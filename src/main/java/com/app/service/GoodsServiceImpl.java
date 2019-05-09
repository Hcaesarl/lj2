package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Goods;
import com.app.mapper.GoodsDAO;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Resource GoodsDAO goodsDao;
public List<Goods> getGoodsPager(@Param("skip") int skip,@Param("size") int size){
return goodsDao.getGoodsPager(skip, size);
}
public  Goods getGoodsById(int id){
return goodsDao.getGoodsById(id);
}
public int getGoodsCount(){
return goodsDao.getGoodsCount();
}
public int insert(Goods entity){
return goodsDao.insert(entity);
}
public int delete(int id){
return goodsDao.delete(id);
}
public int update(Goods entity){
return goodsDao.update(entity);
}
public List<Goods> getAllGoods(){
return goodsDao.getAllGoods();
}

    @Override
    public List<Goods> alllist() {
        return goodsDao.alllist();
    }


    @Override
    public List<Goods> searchReview() {
        return goodsDao.searchReview();
    }

    public List<Goods> searchByName(String name){
    return goodsDao.searchByName("%"+name+"%");
}

    @Override
    public List<Goods> searchMylist(String id) {
        return goodsDao.searchMylist(id);
    }
    @Override
    public void changeReview(String id, String type) {
        goodsDao.changeReview(id, type);
    }

}
