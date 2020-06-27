package com.lihui.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.dao.SpuDao;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Goods;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.SpuService;
@Service
public class SpuServiceImpl implements SpuService{

	@Autowired
	SpuDao spuDao;
	
	@Autowired
	KafkaTemplate<String, String> kafkaTemplate;
	
	@Override
	public PageInfo<Spu> findSpuList(ConditionSpu con, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Spu> list=spuDao.findSpuList(con);
		return new PageInfo<Spu>(list);
	}

	@Override
	public int add(Spu spu) {
		// TODO Auto-generated method stub
		int add = spuDao.add(spu);
		if(add>0) {
			System.out.println("kafka发送消息"+spu.getId());
			kafkaTemplate.send("spu", "add", spu.getId().toString());
		}
		return add;
	}

	@Override
	public int update(Spu spu) {
		// TODO Auto-generated method stub
		return spuDao.update(spu);
	}

	@Override
	public int updateStatus(Integer id, Integer status) {
		// TODO Auto-generated method stub
		return spuDao.updateStatus(id,status);
	}

	@Override
	public int delete(int[] ids) {
		// TODO Auto-generated method stub
		return spuDao.delete(ids);
	}

	@Override
	public Spu findSpuById(int id) {
		// TODO Auto-generated method stub
		return spuDao.findSpuById(id);
	}

	@Override
	public int addGoods(Spu spu) {
		// TODO Auto-generated method stub
		return spuDao.addGoods(spu);
	}

	@Override
	public PageInfo<Goods> findGoodsList(ConditionSpu con, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Goods> list=spuDao.findGoodsList(con);
		return new PageInfo<Goods>(list);
	}

}
