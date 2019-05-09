package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.News;
import com.app.mapper.NewsDAO;
@Service
public class NewsServiceImpl implements NewsService{
	@Resource NewsDAO newsDao;
public List<News> getNewsPager(@Param("skip") int skip,@Param("size") int size){
return newsDao.getNewsPager(skip, size);
}
public  News getNewsById(int id){
return newsDao.getNewsById(id);
}
public int getNewsCount(){
return newsDao.getNewsCount();
}
public int insert(News entity){
return newsDao.insert(entity);
}
public int delete(int id){
return newsDao.delete(id);
}
public int update(News entity){
return newsDao.update(entity);
}
public List<News> getAllNews(){
return newsDao.getAllNews();
}

}
