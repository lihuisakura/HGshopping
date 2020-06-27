package com.lihui.hgshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@RequestMapping({"admin","index","main"})
	public String admin() {
		return "admin/index";
	}
	
	@ResponseBody
	@RequestMapping("login")
	public Boolean login(HttpServletRequest request,@RequestParam("username")String username,@RequestParam("password")String password) {
		if(username.equals("lihui") && password.equals("123456")) {
			request.getSession().setAttribute("admin", "lihui");
			return true;
		}
		return false;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");
		return "user/login";
	}
}
