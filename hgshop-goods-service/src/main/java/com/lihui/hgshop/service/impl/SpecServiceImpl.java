package com.lihui.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lihui.hgshop.dao.SpecDao;
import com.lihui.hgshop.domain.Spec;
import com.lihui.hgshop.domain.SpecOption;
import com.lihui.hgshop.service.SpecService;
@Service
public class SpecServiceImpl implements SpecService {

	@Autowired
	SpecDao specDao;
	/**
	 * 新增规格
	 */
	@Override
	public int add(Spec spec) {
		// TODO Auto-generated method stub
		int re=specDao.addSpec(spec);
		if(re>0) {
			List<SpecOption> optionList = spec.getOptionList();
			for (SpecOption specOption : optionList) {
				specOption.setSpecId(spec.getId());
				re=specDao.addSpecOption(specOption);
			}
			return re;
		}
		return re;
	}

	/**
	 * 根据id查询规格，用于修改回显数据
	 */
	@Override
	public Spec findSpecById(String id) {
		// TODO Auto-generated method stub
		return specDao.findSpecById(id);
	}

	/**
	 * 修改规格信息
	 */
	@Override
	public int update(Spec spec) {
		// TODO Auto-generated method stub
		Integer id = spec.getId();
		if(specDao.deleteOption(id)>0) {
			if(specDao.update(spec)>0) {
				List<SpecOption> optionList = spec.getOptionList();
				for (SpecOption specOption : optionList) {
					specDao.addSpecOption(specOption);
				}
				return 1;
			}
		}
		return 0;
	}

	/**
	 * 批量删除规格
	 */
	@Override
	public int delete(int[] ids) {
		// TODO Auto-generated method stub
		if(specDao.deleteOptionList(ids)>0) {
			if(specDao.deleteSpec(ids)>0) {
				return 1;
			}
		}
		return 0;
	}

	/**
	 * 分页查询规格信息,规格名称模糊查询
	 */
	@Override
	public PageInfo<Spec> findSpecList(String name, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Spec> list=specDao.findSpecList(name);
		return new PageInfo<Spec>(list);
	}

	@Override
	public List<SpecOption> findSpecOptionList(String id) {
		// TODO Auto-generated method stub
		return specDao.findSpecOption(id);
	}

}
