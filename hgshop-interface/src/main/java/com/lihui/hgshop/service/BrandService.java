package com.lihui.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Brand;
/**
 * 品牌管理服务
 * @author lenovo
 *
 */
public interface BrandService {

	/**
	 * 根绝首字母查询
	 * @param firstChar
	 * @return
	 */
	List<Brand> listByFirst(String firstChar);
	
	/**
	 * 
	 * @param firstChar
	 * @return
	 */
	List<Brand> findBrandAll();
	/**
	 * 分页查询品牌列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	PageInfo<Brand> list(Integer pageNum,Integer pageSize);
	/**
	 * 根据id查品牌
	 * @param id
	 * @return
	 */
	Brand findBrandById(String id);
	/**
	 * 修改品牌
	 * @param brand
	 * @return
	 */
	int update(Brand brand);

	int delete(int[] ids);

	int add(Brand brand);
}
