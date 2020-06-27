package com.lihui.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.dao.BrandDao;
import com.lihui.hgshop.domain.Brand;
import com.lihui.hgshop.service.BrandService;
@Service(interfaceClass = BrandService.class)
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandDao brandDao;
	
	@Override
	public List<Brand> listByFirst(String firstChar) {
		// TODO Auto-generated method stub
		return brandDao.listByFirst(firstChar);
	}

	@Override
	public PageInfo<Brand> list(Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Brand> list=brandDao.list();
		return new PageInfo<Brand>(list);
	}

	@Override
	public Brand findBrandById(String id) {
		// TODO Auto-generated method stub
		return brandDao.findBrandById(id);
	}

	@Override
	public int update(Brand brand) {
		// TODO Auto-generated method stub
		return brandDao.update(brand);
	}

	@Override
	public List<Brand> findBrandAll() {
		// TODO Auto-generated method stub
		return brandDao.list();
	}

	@Override
	public int delete(int[] ids) {
		// TODO Auto-generated method stub
		return brandDao.delete(ids);
	}

	@Override
	public int add(Brand brand) {
		// TODO Auto-generated method stub
		return brandDao.add(brand);
	}

	

}
