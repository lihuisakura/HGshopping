package com.lihui.hgshop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lihui.hgshop.domain.Category;
import com.lihui.hgshop.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController {

	@Reference
	CategoryService categoryService;
	
	@RequestMapping("list")
	public String list(){
		
		return "category/list";
	}
	@ResponseBody
	@RequestMapping("treeData")
	public List<Category> treeData(){
		List<Category> category = categoryService.findCategoryList(0);
		return category;
	}
	@ResponseBody
	@RequestMapping("add")
	public Boolean add(Category category){
		int re = categoryService.addCategory(category);
		return re>0;
	}
	@ResponseBody
	@RequestMapping("update")
	public Boolean update(Category category){
		int re = categoryService.updateCategory(category);
		return re>0;
	}
	@ResponseBody
	@RequestMapping("delete")
	public Boolean delete(Integer id){
		int re = categoryService.delete(id);
		return re>0;
	}
}
