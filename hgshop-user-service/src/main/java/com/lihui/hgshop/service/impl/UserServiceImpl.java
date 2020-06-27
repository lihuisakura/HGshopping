package com.lihui.hgshop.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.dao.OrderDao;
import com.lihui.hgshop.dao.UserDao;
import com.lihui.hgshop.domain.Cart;
import com.lihui.hgshop.domain.OrderDetail;
import com.lihui.hgshop.domain.Orders;
import com.lihui.hgshop.domain.User;
import com.lihui.hgshop.service.SkuService;
import com.lihui.hgshop.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Override
	public int register(User user) {
		// TODO Auto-generated method stub
		return userDao.register(user);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	@Override
	public int addCart(Cart cart) {
		// TODO Auto-generated method stub
		return userDao.addCart(cart);
	}

	@Override
	public List<Cart> findCartList(int uid) {
		// TODO Auto-generated method stub
		return userDao.findCartList(uid);
	}

	@Override
	public int deleteCart(int uid, int[] ids) {
		// TODO Auto-generated method stub
		return userDao.deleteCart(uid,ids);
	}

	

	@Override
	public PageInfo<Orders> findOrdersList(Integer pageNum, Integer PageSize, int uid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, PageSize);
		List<Orders> list=orderDao.findOrdersList(uid);
		return new PageInfo<Orders>(list);
	}

	@Override
	public Orders getOrdersById(int id) {
		// TODO Auto-generated method stub
		return orderDao.getOrdersById(id);
	}

	@Override
	public int createOrder(Orders orders, int[] ids) {
		// TODO Auto-generated method stub
		List<Cart> list= userDao.findCartByid(ids);
		if(orderDao.createOrder(orders)>0) {
			for (Cart cart : list) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setSkuid(cart.getSkuid());
				orderDetail.setOid(orders.getOid());
				orderDetail.setTotal(cart.getSumTotal());
				orderDetail.setPnum(cart.getPnum());
				orderDao.createOrderDetail(orderDetail);
				//skuService.updateCount(cart.getSkuid(),cart.getPnum());
			}
			userDao.deleteCart(orders.getUid(), ids);
			return 1;
		}
		
		
		return 0;
	}

}
