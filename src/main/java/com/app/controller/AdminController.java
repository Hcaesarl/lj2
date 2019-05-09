package com.app.controller;

import com.app.entity.Users;
import com.app.service.UsersService;
import com.app.utils.MD5;
import com.app.utils.MainUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/backendui")
public class AdminController {
	
	@Resource
	UsersService userService;

		
	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "backend/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "backend/login";
	}
	@RequestMapping("/signup")
	public String signup() {
		return "backend/reg";
	}
	
	@RequestMapping("/logout")
	public String logout(String retUrl, HttpSession session) {
		session.invalidate();
		return "redirect:" + retUrl;
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model,
			HttpSession session) {
		//√‹¬ÎMD5º”√‹
		String s = MD5.MD51(password);
		Users user = userService.userLogin(username, MD5.MD51(password));

		model.addAttribute("inlogin", true);
		if (user != null) {

			model.addAttribute("user", user);

			session.setAttribute("user", user);
			session.setAttribute("userid", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("usertype", user.getType());

			Users us = userService.getUsersById(Integer.parseInt(session
					.getAttribute("userid") + ""));
			float oldMoney = Float.parseFloat(us.getMoney());
			us.setMoney((oldMoney + MainUtils.LOGINVAL) + "");
			userService.update(us);
			return "redirect:/app/index";
		} else {
			return "backend/login";
		}
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String reg(@RequestParam("username") String username,
			@RequestParam("password") String password,
			String email,
			String tel,
			Model model,
			HttpSession session) {
		Users user = new Users();
		user.setEcard(MainUtils.getEcard());
		user.setMoney("100.00");
		user.setType(1 + "");
		user.setUsername(username);
		user.setPassword(MD5.MD51(password));
		user.setEmail(email);
		user.setTel(tel);
		
		user.setCreated(MainUtils.getTime());
		userService.insert(user);
		model.addAttribute("state", 1);
		return "backend/reg";
	}
}
