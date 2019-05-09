package com.app.controller;
import java.io.File;
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
@Controller
@RequestMapping("/message")
public class  MessageController {
@Resource MessageService messageService;
	
@RequestMapping("/message/add")
	public String messageAdd()
	{		
		return "admin/message/add";
	}
@RequestMapping(value="/message/save",method = RequestMethod.POST)
	public String messageSave(String uid,
String mid,
String content,
String type,
String created,
String updated,
String status,
String subject,
String pid,
Model model)
	{		
		Message modelX = new Message();		
		modelX.setUid(uid);
modelX.setMid(mid);
modelX.setContent(content);
modelX.setType(type);
modelX.setCreated(created);
modelX.setUpdated(updated);
modelX.setStatus(status);
modelX.setSubject(subject);
modelX.setPid(pid);
		
		messageService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/message/add";
	}
@RequestMapping("/message/delete")
	public String messageDelete(int id)
	{
		messageService.delete(id);		
		return "redirect:list";
	}
	
@RequestMapping("/message/list")
	public ModelAndView messageList()
	{
		List<Message> messageList = messageService.getAllMessage();
		System.out.println(messageList.size());
		ModelAndView mav = new ModelAndView("admin/message/list");
		mav.addObject("list",messageList);
		return mav;
	}
@RequestMapping("/message/edit")
	public String messageEdit(String id,Model model)
	{		
		Message message = messageService.getMessageById(Integer.parseInt(id));
		model.addAttribute("model",message);
		return "admin/message/edit";
	}
@RequestMapping(value="/message/update",method = RequestMethod.POST)
	public String messageUpdate(String uid,
String mid,
String content,
String type,
String created,
String updated,
String status,
String subject,
String pid,
int id,
			Model model)
	{		
		
		Message modelX = messageService.getMessageById(id);		
		modelX.setUid(uid);
modelX.setMid(mid);
modelX.setContent(content);
modelX.setType(type);
modelX.setCreated(created);
modelX.setUpdated(updated);
modelX.setStatus(status);
modelX.setSubject(subject);
modelX.setPid(pid);
	
		messageService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/message/edit";
	}
}
