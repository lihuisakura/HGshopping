package com.lihui.hgshop.kafka;

import org.apache.dubbo.config.annotation.Reference;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.kafka.listener.MessageListener;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.domain.SpuEsVo;
import com.lihui.hgshop.service.SpuService;
import com.lihui.hgshop.utils.ElSearchUtil;

public class SpuMessageListner implements MessageListener<String, String>{

	@Autowired
	private RedisTemplate<String, PageInfo<Spu>> redis;
	
	@Reference
	SpuService spuService;
	
	@Autowired
	private ElSearchUtil<SpuEsVo> elSearchUtil;
	
	private Logger logger = Logger.getLogger(SpuMessageListner.class);
	
	{
		System.out.println("------------这里被实例化了。。。。。。。。。。。。。");
	}
	
	public void onMessage(ConsumerRecord<String, String> data) {
		// TODO Auto-generated method stub
		
		String key = data.key();//获取kafka的key
		System.out.println("kafka收到了消息："+key);
		if(null!=key) {
			String value = data.value();
			if(key.equals("add")) {
				System.out.println("新添加的商品id是："+value);
				redis.delete("goods_first_page");
				
				Spu spu = spuService.findSpuById(Integer.parseInt(value));
				SpuEsVo spuEsVo = new SpuEsVo(spu);
				elSearchUtil.saveObject(value, spuEsVo);
			}
		}else {
			logger.info("key没值");
		}
		
	}

}
