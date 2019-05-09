package com.app.controller;
import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;
import com.app.utils.MainUtils;
@Controller
@RequestMapping("/fixform")
public class  FixformController {
@Resource FixformService fixformService;
	
@RequestMapping("/fixform/add")
	public String fixformAdd()
	{		
		return "admin/fixform/add";
	}
@RequestMapping(value="/fixform/save",method = RequestMethod.POST)
	public String fixformSave(String address,
String tel,
String username,
String description,
String fixdesc,
String created,
String fixtime,
String uid,
String state,
Model model,HttpSession session)
	{		
	uid = session.getAttribute("userid")+"";
		Fixform modelX = new Fixform();		
		modelX.setAddress(address);
modelX.setTel(tel);
modelX.setUsername(username);
modelX.setDescription(description);
modelX.setFixdesc(fixdesc);
modelX.setCreated(MainUtils.getTime());
modelX.setFixtime(fixtime);
modelX.setUid(uid);
modelX.setState("1");
		
		fixformService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "留言反馈成功，将尽快与您取得联系!");
		return "admin/fixform/add";
	}
@RequestMapping("/fixform/delete")
	public String fixformDelete(int id,String ret)
	{
		fixformService.delete(id);		
		return "redirect:"+ret;
	}
	
@Resource UsersService uService;

@RequestMapping("/fixform/list")
	public ModelAndView fixformList()
	{
	List<Fixform> fixformList = fixformService.getAllFixform();	
	List<Fixform> fixformList1 = new LinkedList<Fixform>();
	if(fixformList.size()>0)
	{
		for(Fixform f:fixformList)
		{
			f.setU(uService.getUsersById(Integer.parseInt(f.getUid())));
			fixformList1.add(f);
		}
	}
	
	System.out.println(fixformList.size());
	ModelAndView mav = new ModelAndView("admin/fixform/list");
	mav.addObject("list",fixformList1);
	return mav;
	}


@RequestMapping("/fixform/mylist")
public ModelAndView mylist(HttpSession session)
{
	String uid = session.getAttribute("userid")+"";
	List<Fixform> fixformList = fixformService.getAllFixform();	
	List<Fixform> fixformList1 = new LinkedList<Fixform>();
	if(fixformList.size()>0)
	{
		for(Fixform f:fixformList)
		{
			if(f.getUid().equals(uid))
			{
				fixformList1.add(f);
			}
		}
	}
	
	System.out.println(fixformList.size());
	ModelAndView mav = new ModelAndView("admin/fixform/mylist");
	mav.addObject("list",fixformList1);
	return mav;
}

@RequestMapping("/fixform/edit")
	public String fixformEdit(String id,Model model)
	{		
		Fixform fixform = fixformService.getFixformById(Integer.parseInt(id));
		model.addAttribute("model",fixform);
		return "admin/fixform/edit";
	}
@RequestMapping(value="/fixform/update",method = RequestMethod.POST)
	public String fixformUpdate(String address,
String tel,
String username,
String description,
String fixdesc,
String created,
String fixtime,
String uid,
String state,
int id,
			Model model)
	{		
		
		Fixform modelX = fixformService.getFixformById(id);		
		modelX.setAddress(address);
modelX.setTel(tel);
modelX.setUsername(username);
modelX.setDescription(description);
modelX.setFixdesc(fixdesc);
modelX.setFixtime(fixtime);


	
		fixformService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新留言反馈信息成功");
		return "admin/fixform/edit";
	}
}
