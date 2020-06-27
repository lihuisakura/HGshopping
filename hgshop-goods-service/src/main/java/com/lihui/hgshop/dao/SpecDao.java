package com.lihui.hgshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lihui.hgshop.domain.Spec;
import com.lihui.hgshop.domain.SpecOption;

public interface SpecDao {

	int addSpec(Spec spec);

	int addSpecOption(SpecOption specOption);

	List<Spec> findSpecList(@Param("name")String name);

	Spec findSpecById(@Param("id")String id);

	int deleteOption(@Param("id")Integer id);

	int update(Spec spec);

	int deleteOptionList(int[] ids);

	int deleteSpec(int[] ids);

	List<SpecOption> findSpecOption(String id);

}
