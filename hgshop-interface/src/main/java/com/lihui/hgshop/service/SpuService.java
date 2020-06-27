package com.lihui.hgshop.service;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Goods;
import com.lihui.hgshop.domain.Spu;

public interface SpuService {

	PageInfo<Spu> findSpuList(ConditionSpu con,Integer pageNum,Integer pageSize);
	
	int add(Spu spu);
	
	int update(Spu spu);
	
	int updateStatus(Integer id,Integer status);
	
	int delete(int[] ids);
	
	Spu findSpuById(int id);
	
	int addGoods(Spu spu);
	
	PageInfo<Goods> findGoodsList(ConditionSpu con,Integer pageNum,Integer pageSize);
}
