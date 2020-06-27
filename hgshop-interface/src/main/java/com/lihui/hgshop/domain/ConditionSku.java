package com.lihui.hgshop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class ConditionSku extends Sku{

	/**
	 * 
	 */
	private static final long serialVersionUID = 781186412897967112L;

	private BigDecimal startrice;
	private BigDecimal endPrice;
	private String key;
	
	public BigDecimal getStartrice() {
		return startrice;
	}
	public void setStartrice(BigDecimal startrice) {
		this.startrice = startrice;
	}
	public BigDecimal getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(BigDecimal endPrice) {
		this.endPrice = endPrice;
	}
	
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ConditionSku() {
		super();
	}
	public ConditionSku(Integer id, String title, String sellPoint, BigDecimal price, Integer stockCount,
			String barcode, String image, Integer status, Date createTime, Date updateTime, BigDecimal costPrice,
			BigDecimal marketPrice, Integer spuId, String cartThumbnail, Spu spu, List<SpecOption> specOptions,
			BigDecimal startrice, BigDecimal endPrice, String key) {
		super(id, title, sellPoint, price, stockCount, barcode, image, status, createTime, updateTime, costPrice,
				marketPrice, spuId, cartThumbnail, spu, specOptions);
		this.startrice = startrice;
		this.endPrice = endPrice;
		this.key = key;
	}
	@Override
	public String toString() {
		return "ConditionSku [startrice=" + startrice + ", endPrice=" + endPrice + ", key=" + key + "]";
	}
	
	
	
	

	
}
