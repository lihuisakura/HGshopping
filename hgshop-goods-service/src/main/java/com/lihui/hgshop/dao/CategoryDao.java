package com.lihui.hgshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lihui.hgshop.domain.Category;

public interface CategoryDao {

	List<Category> findCategoryList(@Param("id")Integer id);

	int delete(Integer id);

	int addCategory(Category category);

	int updateCategory(Category category);

}
