package com.lihui.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.lihui.hgshop.dao.CategoryDao;
import com.lihui.hgshop.domain.Category;
import com.lihui.hgshop.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public List<Category> findCategoryList(Integer id) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryList(id);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return categoryDao.delete(id);
	}

	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.addCategory(category);
	}

	@Override
	public int updateCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.updateCategory(category);
	}

}
