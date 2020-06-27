package com.lihui.hgshop.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Category;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Goods;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.CategoryService;
import com.lihui.hgshop.service.SpuService;

@Controller
@RequestMapping("index")
public class IndexController {

	@Reference
	SpuService spuService;
	
	@Reference
	CategoryService categoryService;
	
	@Autowired
	RedisTemplate<String, PageInfo<Spu>> redis;
	/**
	 * 
	 * @Title: list 
	 * @Description: 商品列表
	 * @param m
	 * @param pageNum
	 * @param pageSize
	 * @param catId
	 * @return
	 * @return: String
	 */
	@RequestMapping("list")
	public String list(Model m,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "8")Integer pageSize,
			@RequestParam(defaultValue = "0")Integer catId) {
		/*
		 * List<Category> rootCategory = categoryService.findCategoryList(0);
		 * m.addAttribute("rootCategory",rootCategory);
		 */
		//查询商品列表
		ConditionSpu con=new ConditionSpu();
		con.setCategoryId(catId);
		if(catId==0 && pageNum==1) {
			PageInfo<Spu> spu = (PageInfo<Spu>) redis.opsForValue().get("goods_first_page");
			if(null!=spu) {
				m.addAttribute("spuInfo", spu);
			}else {
				//将没有选择分类时的商品数据存入redis
				PageInfo<Spu> spuInfo = spuService.findSpuList(con, pageNum, pageSize);
				m.addAttribute("spuInfo", spuInfo);
				redis.opsForValue().set("goods_first_page", spuInfo, 1000, TimeUnit.SECONDS);
			}
		}else {
			PageInfo<Spu> spuInfo = spuService.findSpuList(con, pageNum, pageSize);
			m.addAttribute("spuInfo", spuInfo);
		}
		
		//将商品推荐表中的商品取出
		PageInfo<Goods> goodsList = spuService.findGoodsList(con, pageNum, pageSize);
		m.addAttribute("goodsList", goodsList);
		
		m.addAttribute("catId", catId);
		return "index/list2";
	}
	/**
	 * 
	 * @Title: treeData 
	 * @Description: 获取商品分类树
	 * @return
	 * @return: List<Category>
	 */
	@ResponseBody
	@RequestMapping("treeData")
	public List<Category> treeData() {
		List<Category> catTree = categoryService.findCategoryList(0);
		return catTree;
	}
}
