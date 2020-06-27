package com.lihui.hgshop.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Cart;
import com.lihui.hgshop.domain.Orders;
import com.lihui.hgshop.domain.User;
import com.lihui.hgshop.service.UserService;
@RequestMapping("user")
@Controller
public class UserController {

	@Reference
	UserService userService;
	
	@RequestMapping("/")
	public String toLogin() {
		return "user/login";
	}
	@RequestMapping("toRegister")
	public String toRegister() {
		return "user/register";
	}
	/**
	 * 
	 * @Title: login 
	 * @Description: 用户登录
	 * @param user
	 * @param m
	 * @return
	 * @return: String
	 */
	@ResponseBody
	@RequestMapping("login")
	public Boolean login(User user,Model m,HttpSession session) {
		String md5Hex = DigestUtils.md5Hex(user.getPassword()+"mtsalt");
		user.setPassword(md5Hex);
		User login = userService.login(user);
		if(null!=login) {
			session.setAttribute("user", login);
			return true;
		}
		return false;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index/list";
	}
	
	
	
	
	
	/**
	 * 
	 * @Title: register 
	 * @Description: 用户注册
	 * @param user
	 * @param m
	 * @return
	 * @return: String
	 */
	@ResponseBody
	@RequestMapping("register")
	public Boolean register(User user,Model m) {
		String md5Hex = DigestUtils.md5Hex(user.getPassword()+"mtsalt");
		user.setPassword(md5Hex);
		int register = userService.register(user);
		return register>0;
	}
	/**
	 * 
	 * @Title: addCart 
	 * @Description: 加入购物车
	 * @param uid
	 * @param skuid
	 * @param pnum
	 * @param sumTotal
	 * @return
	 * @return: Boolean
	 */
	@ResponseBody
	@RequestMapping("addCart")
	public Boolean addCart(Integer uid,Integer skuid,Integer pnum,BigDecimal sumTotal) {
		Cart cart = new Cart(null, uid, skuid, pnum, null, null, sumTotal, null);
		
		return userService.addCart(cart)>0;
	}
	
	@RequestMapping("toIndex")
	public String index() {
		return "/user/index";
	}
	@RequestMapping("toCart")
	public String toCart(HttpSession session,Model m) {
		User user = (User) session.getAttribute("user");
		Integer uid = user.getUid();
		List<Cart> cart = userService.findCartList(uid);
		m.addAttribute("cart", cart);
		return "/user/cart";
	}
	/**
	 * 
	 * @Title: toOrder 
	 * @Description: 订单列表
	 * @param session
	 * @param m
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("toOrder")
	public String toOrder(HttpSession session,Model m,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		User user = (User) session.getAttribute("user");
		Integer uid = user.getUid();
		PageInfo<Orders> order = userService.findOrdersList(pageNum, pageSize, uid);
		m.addAttribute("order", order);
		return "/user/order";
	}
	/**
	 * 
	 * @Title: createOrder 
	 * @Description: 创建订单
	 * @param request
	 * @param ids
	 * @param address
	 * @param sumtotal
	 * @return
	 * @return: boolean
	 */
	@RequestMapping("createOrder")
	@ResponseBody
	public boolean createOrder(HttpServletRequest request,@RequestParam("ids[]")int[] ids,@RequestParam("address")String address,@RequestParam("sumtotal")BigDecimal sumtotal) {
		User user = (User) request.getSession().getAttribute("user");
		Orders orders=new Orders(null, user.getUid(), sumtotal, address, null, null);
		return userService.createOrder(orders,ids)>0;
	}
	
	/**
	 * 
	 * @Title: deleteCart 
	 * @Description: 删除购物车
	 * @param request
	 * @param ids
	 * @return
	 * @return: Boolean
	 */
	@RequestMapping("deleteCart")
	@ResponseBody
	public Boolean deleteCart(HttpServletRequest request,@RequestParam("ids[]")int[] ids) {
		User user = (User) request.getSession().getAttribute("user");
		return userService.deleteCart(user.getUid(), ids)>0;
	}
	
}
