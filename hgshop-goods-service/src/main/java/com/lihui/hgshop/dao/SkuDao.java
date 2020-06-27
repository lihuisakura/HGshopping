package com.lihui.hgshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lihui.hgshop.domain.ConditionSku;
import com.lihui.hgshop.domain.Sku;
import com.lihui.hgshop.domain.SpecOption;

public interface SkuDao {

	List<Sku> findSkuList(ConditionSku con);

	Sku findSkuById(String id);

	int addSku(Sku sku);

	int addOption(@Param("list")List<SpecOption> list, @Param("id")Integer id);

	int updateSku(Sku sku);

	int deleteOption(Integer id);

	int deleteOptions(int[] ids);

	int deleteSku(int[] ids);

	List<Sku> findSkuBySpuId(String id);

	void updateCount(@Param("skuid")Integer skuid, @Param("pnum")Integer pnum);

}
