package com.app.controller;

import com.app.entity.Goods;
import com.app.entity.Infocate;
import com.app.entity.News;
import com.app.entity.Ordertab;
import com.app.service.*;
import com.app.utils.MainUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/app")
public class HomeController {
	
	@Resource
	UsersService userService;

	@Resource GoodsService gService;
	
	@Resource InfocateService cService;
	@Resource NewsService nService;
	@RequestMapping("/news")
	public String news(String cateId,Model model) {
		
		List<News> nList = nService.getAllNews();
		List<News> nList1 = new LinkedList<News>();
		if(cateId!=null)
		{
			for (News n:nList) {
				if(n.getUid().equals(cateId))
					nList1.add(n);
			}
			model.addAttribute("nlist",nList1);
		}else{			
			model.addAttribute("nlist",nList);
		}
		

		model.addAttribute("clist",cService.getByType(2));
		model.addAttribute("clist1",cService.getByType(1));
		return "home/news";
	}
	
	@Resource OrdertabService oService;
	
	@RequestMapping("/buy")
	public String buy(Model model,int id,HttpSession session) 
	{if (session.getAttribute("user") == null) {
		return "redirect:index";
	}
		Goods g = gService.getGoodsById(id);
		Ordertab m = new Ordertab();
		m.setUid(session.getAttribute("userid")+"");
		m.setCreated(MainUtils.getTime());
		m.setCuid(g.getUid());
		m.setPid(id+"");
		m.setNum(1 +"");
		m.setPrice(g.getPrice());
		
		
		oService.insert(m);
		model.addAttribute("message", "buy success");
		return "redirect:shop";
	}
	
	
	@RequestMapping("/shop")
	public String shop(String cateId,Model model) {
		
		List<Goods> list = gService.getAllGoods();
		List<Goods> list1 = new LinkedList<Goods>();
		if(list.size()>0)
		{
			for (Goods g:list) {
				g.setU(userService.getUsersById(Integer.parseInt(g.getUid())));
				if(cateId!=null){
					if(g.getCategory().equals(cateId)){
						list1.add(g);	
					}
				}else{				
					list1.add(g);
				}
			}
		}
		model.addAttribute("list",list1);
		model.addAttribute("clist",cService.getByType(2));
		model.addAttribute("clist1",cService.getByType(1));
		return "home/shop";
	}
	

@RequestMapping("/showNews")
	public ModelAndView showNews(int id,Model model)
	{
		ModelAndView mav = new ModelAndView("home/showNews");
		News article = nService.getNewsById(id);
		model.addAttribute("model",article);
		

		model.addAttribute("clist",cService.getByType(2));
		model.addAttribute("clist1",cService.getByType(1));
		return mav;
	}



@RequestMapping("/detail")
	public ModelAndView detail(int id,Model model)
	{
		ModelAndView mav = new ModelAndView("home/detail");
		Goods gd = gService.getGoodsById(id);
		gd.setU(userService.getUsersById(Integer.parseInt(gd.getUid())));
		model.addAttribute("model",gd);
		model.addAttribute("clist",cService.getByType(2));
		model.addAttribute("clist1",cService.getByType(1));
		return mav;
	}

	
	@RequestMapping("/index")
	public String index(HttpSession session,Model model) {

		List<News> nList = nService.getAllNews();
		Random r = new Random();
		int index = r.nextInt(nList.size());
		int index2 = r.nextInt(nList.size());
		
		News topNews = nList.get(index);
		News fdNews = nList.get(index2);
		
		
		List<Goods> gList = gService.getAllGoods();
		int index3 = r.nextInt(gList.size());
		int index4 = r.nextInt(gList.size());
		int index5 = r.nextInt(gList.size());
		int index6 = r.nextInt(gList.size());
		Goods topGoods = gList.get(index3);
		Goods midGoods = gList.get(index4);
		Goods midGoods1 = gList.get(index5);
		Goods midGoods2 = gList.get(index6);
		
		
		
		model.addAttribute("n1", topNews);
		model.addAttribute("n2", fdNews);
		model.addAttribute("g1", topGoods);
		model.addAttribute("g2", midGoods);
		model.addAttribute("g3", midGoods1);
		model.addAttribute("g4", midGoods2);
		List<Infocate> byType = cService.getByType(2);
		List<Infocate> byType1 = cService.getByType(1);
		model.addAttribute("clist",cService.getByType(2));
		model.addAttribute("clist1",cService.getByType(1));
		model.addAttribute("nlist",nList);
		model.addAttribute("glist",gList);
		return "home/index";
	}
	
	
}
