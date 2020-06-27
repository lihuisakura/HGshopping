package com.lihui.hgshop.dao;

import java.util.List;

import com.lihui.hgshop.domain.Brand;

public interface BrandDao {

	List<Brand> listByFirst(String firstChar);

	List<Brand> list();

	Brand findBrandById(String id);

	int update(Brand brand);

	int delete(int[] ids);

	int add(Brand brand);

}
