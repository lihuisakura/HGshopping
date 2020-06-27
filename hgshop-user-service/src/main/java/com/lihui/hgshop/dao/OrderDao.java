package com.lihui.hgshop.dao;

import java.util.List;

import com.lihui.hgshop.domain.OrderDetail;
import com.lihui.hgshop.domain.Orders;

public interface OrderDao {

	int createOrder(Orders orders);

	void createOrderDetail(OrderDetail orderDetail);

	List<Orders> findOrdersList(int uid);

	Orders getOrdersById(int id);

}
