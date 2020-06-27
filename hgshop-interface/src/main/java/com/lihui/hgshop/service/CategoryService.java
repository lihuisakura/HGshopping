package com.lihui.hgshop.service;

import java.util.List;

import com.lihui.hgshop.domain.Category;

public interface CategoryService {

	List<Category> findCategoryList(Integer id);
	
	int delete(Integer id);
	
	int addCategory(Category category);
	
	int updateCategory(Category category);
	
	
}
