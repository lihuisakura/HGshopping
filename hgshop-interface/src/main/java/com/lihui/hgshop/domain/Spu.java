package com.lihui.hgshop.domain;

import java.io.Serializable;

public class Spu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String goodsName;
	private String isMarketable;
	private Integer brandId;
	private String caption;
	private Integer categoryId;
	private String smallPic;
	
	private Brand brand;
	private Category category;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getIsMarketable() {
		return isMarketable;
	}
	public void setIsMarketable(String isMarketable) {
		this.isMarketable = isMarketable;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getSmallPic() {
		return smallPic;
	}
	public void setSmallPic(String smallPic) {
		this.smallPic = smallPic;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Spu(Integer id, String goodsName, String isMarketable, Integer brandId, String caption, Integer categoryId,
			String smallPic, Brand brand, Category category) {
		super();
		this.id = id;
		this.goodsName = goodsName;
		this.isMarketable = isMarketable;
		this.brandId = brandId;
		this.caption = caption;
		this.categoryId = categoryId;
		this.smallPic = smallPic;
		this.brand = brand;
		this.category = category;
	}
	public Spu() {
		super();
	}
	@Override
	public String toString() {
		return "Spu [id=" + id + ", goodsName=" + goodsName + ", isMarketable=" + isMarketable + ", brandId=" + brandId
				+ ", caption=" + caption + ", categoryId=" + categoryId + ", smallPic=" + smallPic + ", brand=" + brand
				+ ", category=" + category + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((goodsName == null) ? 0 : goodsName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Spu other = (Spu) obj;
		if (goodsName == null) {
			if (other.goodsName != null)
				return false;
		} else if (!goodsName.equals(other.goodsName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
	
}
