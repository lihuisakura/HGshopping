package com.lihui.hgshop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.SpuService;

@ContextConfiguration({"classpath:applicationContext-dao.xml",
	"classpath:applicationContext-dubbo-provider.xml",
	"classpath:applicationContext-kafka-producer.xml"})
@RunWith(SpringRunner.class)
public class TestSpu {

	@Autowired
	SpuService spuService;
	
	@Test
	public void testFind() {
		PageInfo<Spu> spu = spuService.findSpuList(new ConditionSpu(), 1, 3);
		List<Spu> list = spu.getList();
		for (Spu spu2 : list) {
			System.out.println(spu2);
		}
	}
}
