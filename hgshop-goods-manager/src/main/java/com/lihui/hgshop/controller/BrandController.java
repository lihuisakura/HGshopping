package com.lihui.hgshop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Brand;
import com.lihui.hgshop.service.BrandService;

@Controller
@RequestMapping("brand")
public class BrandController {

	@Reference
	BrandService brandService;
	
	@RequestMapping("list")
	public String list(Model m,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		PageInfo<Brand> info = brandService.list(pageNum, pageSize);
		m.addAttribute("info", info);
		return "brand/list";
	}
	@ResponseBody
	@RequestMapping("findBrandAll")
	public List<Brand> findBrandAll() {
		return brandService.findBrandAll();
	}
	@RequestMapping("toUpdate")
	public String toUpdate(Model m,String id) {
		Brand brand= brandService.findBrandById(id);
		m.addAttribute("brand", brand);
		return "brand/update";
	}
	@RequestMapping("toAdd")
	public String toAdd() {
		return "brand/add";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Boolean update(Brand brand) {
		if(brandService.update(brand)>0) {
			return true;
		}
		return false;
	}
	@RequestMapping("add")
	@ResponseBody
	public Boolean add(Brand brand) {
		if(brandService.add(brand)>0) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("delete")
	public Boolean delete(@RequestParam("ids[]")int[] ids) {
		return brandService.delete(ids)>0;
	}
}
