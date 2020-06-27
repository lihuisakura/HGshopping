package com.lihui.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.dao.SkuDao;
import com.lihui.hgshop.domain.ConditionSku;
import com.lihui.hgshop.domain.Sku;
import com.lihui.hgshop.domain.SpecOption;
import com.lihui.hgshop.service.SkuService;

@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	SkuDao skuDao;
	
	@Override
	public PageInfo<Sku> findSkuList(ConditionSku con, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Sku> list=skuDao.findSkuList(con);
		return new PageInfo<Sku>(list);
	}

	@Override
	public Sku findSkuById(String id) {
		// TODO Auto-generated method stub
		return skuDao.findSkuById(id);
	}

	
	

	

	@Override
	public int delete(int[] ids) {
		// TODO Auto-generated method stub
		if(skuDao.deleteSku(ids)>0) {
			if(skuDao.deleteOptions(ids)>0) {
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int updateStatus(int id, int status) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int add(Sku sku, List<SpecOption> list) {
		// TODO Auto-generated method stub
		if(skuDao.addSku(sku)>0) {
			if(skuDao.addOption(list,sku.getId())>0) {
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int update(Sku sku, List<SpecOption> list) {
		if(skuDao.updateSku(sku)>0) {
			if(skuDao.deleteOption(sku.getId())>0) {
				if(skuDao.addOption(list, sku.getId())>0) {
					return 1;
				}
			}
		}
		return 0;
	}

	/**
	 * 根据spu商品，查到所有的sku商品库存
	 */
	@Override
	public List<Sku> findSkuBySpuId(String id) {
		// TODO Auto-generated method stub
		return skuDao.findSkuBySpuId(id);
	}

	@Override
	public void updateCount(Integer skuid, Integer pnum) {
		// TODO Auto-generated method stub
		skuDao.updateCount(skuid,pnum);
	}

}
