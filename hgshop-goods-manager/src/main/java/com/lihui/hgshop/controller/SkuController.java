package com.lihui.hgshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSku;
import com.lihui.hgshop.domain.Sku;
import com.lihui.hgshop.domain.Spec;
import com.lihui.hgshop.domain.SpecOption;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.SkuService;
import com.lihui.hgshop.service.SpecService;
import com.lihui.hgshop.service.SpuService;
import com.lihui.hgshop.utils.FileUtils;

@Controller
@RequestMapping("sku")
public class SkuController {

	@Reference
	SkuService skuService;
	
	@Reference
	SpuService spuService; 
	
	@Reference
	SpecService specService;
	/**
	 * 
	 * @Title: list 
	 * @Description: 分页查询商品库存信息列表
	 * @param m
	 * @param con
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("list")
	public String list(Model m,ConditionSku con,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		PageInfo<Sku> info = skuService.findSkuList(con, pageNum, pageSize);
		m.addAttribute("info", info);
		m.addAttribute("con", con);
		return "sku/list";
	}
	/**
	 * 
	 * @Title: toAdd 
	 * @Description: 增加商品库存
	 * @param id
	 * @param m
	 * @return
	 * @return: String
	 */
	@RequestMapping("toAdd")
	public String toAdd(int id,Model m) {
		Spu spu = spuService.findSpuById(id);
		m.addAttribute("spu", spu);
		PageInfo<Spec> spec = specService.findSpecList(null, 1, 100);
		m.addAttribute("spec", spec);
		return "sku/add";
	}
	@RequestMapping("toUpt")
	public String toUpt(Model m,String id) {
		Sku sku = skuService.findSkuById(id);
		m.addAttribute("sku", sku);
		PageInfo<Spec> spec = specService.findSpecList(null, 1, 100);
		m.addAttribute("spec", spec);
		return "sku/update";
	}
	@RequestMapping("toShow")
	public String toShow(Model m,String id) {
		Sku sku = skuService.findSkuById(id);
		m.addAttribute("sku", sku);
		return "sku/show";
	}
	
	
	
	@RequestMapping("findSkuById")
	@ResponseBody
	public Sku findSkuById(String id) {
		return skuService.findSkuById(id);
	}
	
	
	
	
	
	/**
	 * 
	 * @Title: add 
	 * @Description: 添加sku库存
	 * @param sku
	 * @param specId
	 * @param optionId
	 * @param bigFile
	 * @param smFile
	 * @return
	 * @return: Boolean
	 */
	@RequestMapping("add")
	@ResponseBody
	public Boolean add(Sku sku,
			int[] specId,
			int[] optionId,
			@RequestParam("bigFile")MultipartFile bigFile,
			@RequestParam("smFile")MultipartFile smFile) {
		List<SpecOption> list=new ArrayList<SpecOption>();
		for (int i = 0; i < optionId.length && i<specId.length; i++) {
			SpecOption specoption=new SpecOption();
			specoption.setSpecId(specId[i]);
			specoption.setId(optionId[i]);
			list.add(specoption);
		}
		if(null!=bigFile) {
			String newName ="";
			try {
				newName= FileUtils.processFile(bigFile);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			sku.setImage(newName);
			/*
			 * String big = bigFile.getOriginalFilename(); String ename =
			 * big.substring(big.lastIndexOf(".")); String sname =
			 * UUID.randomUUID().toString(); String path="e:/pic/"; File file=new
			 * File(path+sname+ename); try { bigFile.transferTo(file); } catch (Exception e)
			 * { // TODO Auto-generated catch block e.printStackTrace(); }
			 * sku.setImage(sname+ename);
			 */
		}
		if(null!=smFile) {
			String newName ="";
			try {
				newName= FileUtils.processFile(smFile);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			sku.setCartThumbnail(newName);
			/*
			 * String big = smFile.getOriginalFilename(); String ename =
			 * big.substring(big.lastIndexOf(".")); String sname =
			 * UUID.randomUUID().toString(); String path="e:/pic/"; File file=new
			 * File(path+sname+ename); try { smFile.transferTo(file); } catch (Exception e)
			 * { // TODO Auto-generated catch block e.printStackTrace(); }
			 * sku.setCartThumbnail(sname+ename);
			 */
		}
		Integer count = sku.getStockCount();
		if(count>0) {
			sku.setStatus(1);
		}else {
			sku.setStatus(0);
		}
		return skuService.add(sku,list)>0;
	}
	/**
	 * 
	 * @Title: update 
	 * @Description: 修改sku
	 * @param sku
	 * @param specId
	 * @param optionId
	 * @param bigFile
	 * @param smFile
	 * @return
	 * @return: Boolean
	 */
	@RequestMapping("update")
	@ResponseBody
	public Boolean update(Sku sku,
			int[] specId,
			int[] optionId,
			@RequestParam("bigFile")MultipartFile bigFile,
			@RequestParam("smFile")MultipartFile smFile) {
		List<SpecOption> list=new ArrayList<SpecOption>();
		for (int i = 0; i < optionId.length && i<specId.length; i++) {
			SpecOption specoption=new SpecOption();
			specoption.setSpecId(specId[i]);
			specoption.setId(optionId[i]);
			list.add(specoption);
		}
		if(null!=bigFile) {
			String newName ="";
			try {
				newName= FileUtils.processFile(bigFile);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			sku.setImage(newName);
			/*
			 * String big = bigFile.getOriginalFilename(); String ename =
			 * big.substring(big.lastIndexOf(".")); String sname =
			 * UUID.randomUUID().toString(); String path="e:/pic/"; File file=new
			 * File(path+sname+ename); try { bigFile.transferTo(file); } catch (Exception e)
			 * { // TODO Auto-generated catch block e.printStackTrace(); }
			 * sku.setImage(sname+ename);
			 */
		}
		if(null!=smFile) {
			String newName ="";
			try {
				newName= FileUtils.processFile(smFile);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			sku.setCartThumbnail(newName);
			/*
			 * String big = smFile.getOriginalFilename(); String ename =
			 * big.substring(big.lastIndexOf(".")); String sname =
			 * UUID.randomUUID().toString(); String path="e:/pic/"; File file=new
			 * File(path+sname+ename); try { smFile.transferTo(file); } catch (Exception e)
			 * { // TODO Auto-generated catch block e.printStackTrace(); }
			 * sku.setCartThumbnail(sname+ename);
			 */
		}
		Integer count = sku.getStockCount();
		if(count>0) {
			sku.setStatus(1);
		}else {
			sku.setStatus(0);
		}
		return skuService.update(sku,list)>0;
	}
	/**
	 * 
	 * @Title: delete 
	 * @Description: 删除
	 * @param ids
	 * @return
	 * @return: Boolean
	 */
	@ResponseBody
	@RequestMapping("delete")
	public Boolean delete(@RequestParam("ids[]")int[] ids) {
		int delete = skuService.delete(ids);
		return delete>0;
	}
}
