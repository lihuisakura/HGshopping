package com.lihui.hgshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.domain.ConditionSpu;
import com.lihui.hgshop.domain.Spu;
import com.lihui.hgshop.service.SpuService;
import com.lihui.hgshop.utils.FileUtils;

@Controller
@RequestMapping("spu")
public class SpuController {

	@Reference
	SpuService spuService;
	/**
	 * 
	 * @Title: tui 
	 * @Description: 将商品添加到推荐表
	 * @param id
	 * @return
	 * @return: Boolean
	 */
	@ResponseBody
	@RequestMapping("tui")
	public Boolean tui(int id) {
		Spu spu = spuService.findSpuById(id);
		int re = spuService.addGoods(spu);
		return re>0;
	}
	
	@RequestMapping("list")
	public String list(Model m,ConditionSpu con,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		PageInfo<Spu> info = spuService.findSpuList(con, pageNum, pageSize);
		m.addAttribute("info", info);
		m.addAttribute("con", con);
		return "spu/list";
	}
	
	@RequestMapping("updateStatus")
	@ResponseBody
	public Boolean updateStatus(int id,int status) {
		return spuService.updateStatus(id, status)>0;
	}
	
	@RequestMapping("toAdd")
	public String toAdd() {
		return "spu/add";
	}
	@RequestMapping("toUpt")
	public String toUpt(Model m,int id) {
		Spu spu = spuService.findSpuById(id);
		m.addAttribute("spu", spu);
		return "spu/update";
	}
	@RequestMapping("toShow")
	public String toShow(Model m,int id) {
		Spu spu = spuService.findSpuById(id);
		m.addAttribute("spu", spu);
		return "spu/show";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public Boolean delete(@RequestParam("ids[]")int[]ids) {
		return spuService.delete(ids)>0;
	}
	
	@RequestMapping("add")
	@ResponseBody
	public Boolean add(Spu spu,@RequestParam("file")MultipartFile file) {
		String newName ="";
		try {
			newName= FileUtils.processFile(file);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		/*
		 * String name = file.getOriginalFilename(); String endName =
		 * name.substring(name.lastIndexOf(".")); String startName =
		 * UUID.randomUUID().toString(); String path="e:/pic/"; String
		 * newName=startName+endName; File files=new File(path+newName); try {
		 * file.transferTo(files); } catch (Exception e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); }
		 */
		spu.setSmallPic(newName);
		return spuService.add(spu)>0;
	}
	@RequestMapping("update")
	@ResponseBody
	public Boolean update(Spu spu,@RequestParam("file")MultipartFile file) {
		String newName ="";
		try {
			newName= FileUtils.processFile(file);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		/*
		 * String name = file.getOriginalFilename(); String endName =
		 * name.substring(name.lastIndexOf(".")); String startName =
		 * UUID.randomUUID().toString(); String path="e:/pic/"; String
		 * newName=startName+endName; File files=new File(path+newName); try {
		 * file.transferTo(files); } catch (Exception e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); }
		 */
		spu.setSmallPic(newName);
		return spuService.update(spu)>0;
	}
	
}
