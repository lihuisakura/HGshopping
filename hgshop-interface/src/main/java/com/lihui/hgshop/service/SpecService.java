package com.lihui.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Spec;
import com.lihui.hgshop.domain.SpecOption;

/**
 * 规格管理服务
 * @author lenovo
 *
 */
public interface SpecService {

	//新增规格
	int add(Spec spec);
	Spec findSpecById(String id);
	
	int update(Spec spec);
	
	int delete(int[] ids);
	
	PageInfo<Spec> findSpecList(String name,Integer pageNum,Integer pageSize);
	
	List<SpecOption> findSpecOptionList(String id);
}
