package com.lihui.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSku;
import com.lihui.hgshop.domain.Sku;
import com.lihui.hgshop.domain.SpecOption;

public interface SkuService {

	PageInfo<Sku> findSkuList(ConditionSku con,Integer pageNum,Integer pageSize);
	
	Sku findSkuById(String id);
	
	List<Sku> findSkuBySpuId(String id);
	
	
	
	int delete(int[] ids);
	
	int updateStatus(int id,int status);

	int add(Sku sku, List<SpecOption> list);

	int update(Sku sku, List<SpecOption> list);

	void updateCount(Integer skuid, Integer pnum);
	
	
	
}
