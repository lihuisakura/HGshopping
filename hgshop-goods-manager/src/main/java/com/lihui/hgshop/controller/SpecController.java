package com.lihui.hgshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.Spec;
import com.lihui.hgshop.domain.SpecOption;
import com.lihui.hgshop.service.SpecService;

@Controller
@RequestMapping("spec")
public class SpecController {

	@Reference
	SpecService specService;
	
	@RequestMapping("list")
	public String list(Model m,String name,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		PageInfo<Spec> info = specService.findSpecList(name, pageNum, pageSize);
		m.addAttribute("info", info);
		m.addAttribute("name", name);
		return "spec/list";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(Model m,String id) {
		Spec spec = specService.findSpecById(id);
		m.addAttribute("spec", spec);
		return "spec/update";
	}
	@RequestMapping("toAdd")
	public String toAdd() {
		return "spec/add";
	}
	@ResponseBody
	@RequestMapping("delete")
	public Boolean delete(@RequestParam("ids[]")int[] ids) {
		int delete = specService.delete(ids);
		return delete>0;
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Boolean update(Spec spec) {
		List<SpecOption> optionList = spec.getOptionList();
		List<SpecOption> list=new ArrayList<SpecOption>();
		for (SpecOption specOption : optionList) {
			if(specOption.getOptionName()!=null && specOption.getOrders()!=null) {
				list.add(specOption);
			}
		}
		spec.setOptionList(list);
		if(specService.update(spec)>0) {
			return true;
		}
		return false;
	}
	@RequestMapping("add")
	@ResponseBody
	public Boolean add(Spec spec) {
		List<SpecOption> optionList = spec.getOptionList();
		List<SpecOption> list=new ArrayList<SpecOption>();
		for (SpecOption specOption : optionList) {
			if(specOption.getOptionName()!=null && specOption.getOrders()!=null) {
				list.add(specOption);
			}
		}
		spec.setOptionList(list);
		if(specService.add(spec)>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("findSpecOptionList")
	public List<SpecOption> findSpecOptionList(String id){
		List<SpecOption> list= specService.findSpecOptionList(id);
		return list;
	}
	
}
