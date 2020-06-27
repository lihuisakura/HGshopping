package com.lihui.hgshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Goods;
import com.lihui.hgshop.domain.Spu;

public interface SpuDao {

	Spu findSpuById(int id);

	List<Spu> findSpuList(ConditionSpu con);

	int add(Spu spu);

	int update(Spu spu);

	int updateStatus(@Param("id")Integer id, @Param("status")Integer status);

	int delete(int[] ids);

	int addGoods(Spu spu);

	List<Goods> findGoodsList(ConditionSpu con);

}
