package com.lihui.hgshop.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lihui.hgshop.domain.Cart;
import com.lihui.hgshop.domain.User;

public interface UserDao {

	User login(User user);

	int register(User user);

	int deleteCart(@Param("uid")int uid, @Param("ids")int[] ids);

	List<Cart> findCartList(int uid);

	int addCart(Cart cart);

	List<Cart> findCartByid(int[] ids);

}
