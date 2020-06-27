package com.lihui.hgshop.domain;

import java.io.Serializable;
import java.util.List;

public class Spec implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String specName;
	private List<SpecOption> optionList;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public List<SpecOption> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<SpecOption> optionList) {
		this.optionList = optionList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Spec(Integer id, String specName, List<SpecOption> optionList) {
		super();
		this.id = id;
		this.specName = specName;
		this.optionList = optionList;
	}
	public Spec() {
		super();
	}
	@Override
	public String toString() {
		return "Spec [id=" + id + ", specName=" + specName + ", optionList=" + optionList + "]";
	}
	
}
