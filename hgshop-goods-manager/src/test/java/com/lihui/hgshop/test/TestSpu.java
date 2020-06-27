package com.lihui.hgshop.test;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.SpuService;

@ContextConfiguration("classpath:dubboconsumer.xml")
@RunWith(SpringRunner.class)
public class TestSpu {

	@Reference
	SpuService spuService;
	
	@Test
	public void TestFind() {
		PageInfo<Spu> spu = spuService.findSpuList(new ConditionSpu(), 1, 3);
		List<Spu> list = spu.getList();
		for (Spu spu2 : list) {
			System.out.println(spu2);
		}
	}
	
}
