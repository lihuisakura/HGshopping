package com.lihui.hgshop.service;

import java.math.BigDecimal;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Cart;
import com.lihui.hgshop.domain.Orders;
import com.lihui.hgshop.domain.User;
/**
 * 
 * @ClassName: UserService 
 * @Description: 用户接口
 * @author:lh 
 * @date: 2020年4月7日 下午2:42:44
 */
public interface UserService {

	/**
	 * 
	 * @Title: register 
	 * @Description: 注册
	 * @param user
	 * @return
	 * @return: int
	 */
	int register(User user);
	
	/**
	 * 
	 * @Title: login 
	 * @Description: 登录
	 * @param user
	 * @return
	 * @return: User
	 */
	User login(User user);
	/**
	 * 
	 * @Title: addCart 
	 * @Description: 加入购物车
	 * @param uid
	 * @param skuId
	 * @param num
	 * @return
	 * @return: int
	 */
	int addCart(Cart cart);
	/**
	 * 
	 * @Title: findCartList 
	 * @Description: 购物车列表
	 * @param uid
	 * @return
	 * @return: List<Cart>
	 */
	List<Cart> findCartList(int uid);
	/**
	 * 
	 * @Title: deleteCart 
	 * @Description: 删除购物车
	 * @param uid
	 * @param ids
	 * @return
	 * @return: int
	 */
	int deleteCart(int uid,int[] ids);
	/**
	 * 
	 * @Title: createOrder 
	 * @Description: 创建商品订单
	 * @param ids
	 * @param address
	 * @return
	 * @return: int
	 */
	int createOrder(Orders orders, int[] ids);
	/**
	 * 
	 * @Title: findOrdersList 
	 * @Description: 订单分页列表
	 * @param pageNum
	 * @param PageSize
	 * @param uid
	 * @return
	 * @return: PageInfo<Orders>
	 */
	PageInfo<Orders> findOrdersList(Integer pageNum,Integer PageSize,int uid);
	/**
	 * 
	 * @Title: getOrdersById 
	 * @Description: 订单详情
	 * @param id
	 * @return
	 * @return: Orders
	 */
	Orders getOrdersById(int id);

	
	
}
