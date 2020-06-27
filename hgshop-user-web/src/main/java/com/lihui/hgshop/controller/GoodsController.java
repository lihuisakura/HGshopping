package com.lihui.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lihui.hgshop.domain.Sku;
import com.lihui.hgshop.domain.SpecOption;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.domain.SpuEsVo;
import com.lihui.hgshop.service.SkuService;
import com.lihui.hgshop.service.SpuService;
import com.lihui.hgshop.utils.ElSearchUtil;

@Controller
@RequestMapping("goods")
public class GoodsController {

	Logger log=Logger.getLogger(GoodsController.class);
	
	@Reference
	SpuService spuService;
	
	@Reference
	SkuService skuService;
	
	@Autowired
	ElSearchUtil<SpuEsVo> es;
	
	@RequestMapping("detail")
	public String detail(Model m,Integer id) {
		
		//打印日志
		log.info("this is GoodsController detail .......... ");
		
		Spu spu = spuService.findSpuById(id);
		m.addAttribute("spu", spu);
		List<Sku> sku = skuService.findSkuBySpuId(id+"");
		m.addAttribute("sku", sku);
		
		return "index/detail";
	}
	
	@RequestMapping("findSkuById")
	@ResponseBody
	public Sku findSkuById(String id) {
		return skuService.findSkuById(id);
	}
	
	@RequestMapping("search")
	public String search(String key,HttpServletRequest request,@RequestParam(defaultValue = "1")Integer pageNum) {
		System.out.println("--"+key);
		AggregatedPage<SpuEsVo> search = es.queryObjects(SpuEsVo.class, pageNum, 8, new String[] {"goodsName","caption","brandName","categoryName"}, key);
		request.setAttribute("search", search);
		request.setAttribute("key", key);
		return "index/search";
	}
	
}
