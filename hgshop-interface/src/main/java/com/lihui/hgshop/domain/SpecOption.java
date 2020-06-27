package com.lihui.hgshop.domain;

import java.io.Serializable;

public class SpecOption implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String optionName;//属性名称
	private String specName;//规格名称
	private Integer specId;
	private Integer orders;
	
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public Integer getOrders() {
		return orders;
	}
	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public SpecOption(Integer id, String optionName, String specName, Integer specId, Integer orders) {
		super();
		this.id = id;
		this.optionName = optionName;
		this.specName = specName;
		this.specId = specId;
		this.orders = orders;
	}
	public SpecOption() {
		super();
	}
	@Override
	public String toString() {
		return "SpecOption [id=" + id + ", optionName=" + optionName + ", specName=" + specName + ", specId=" + specId
				+ ", orders=" + orders + "]";
	}
	
	
	
}
