package com.lihui.hgshop.domain;

import java.io.Serializable;

import org.springframework.data.elasticsearch.annotations.Document;
@Document(indexName = "hgshop",type="spu")
public class SpuEsVo implements Serializable{

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String goodsName;
	private Integer brandId;
	private String caption;
	private Integer categoryId;
	private String smallPic;
	
	private String brandName;
	private String categoryName;
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
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public SpuEsVo() {
		super();
	}
	public SpuEsVo(Spu spu) {
		super();
		this.id=spu.getId();
		this.brandName= spu.getBrand()==null?"": spu.getBrand().getName();
		this.categoryName=spu.getCategory()==null?"":spu.getCategory().getName();
		this.smallPic=spu.getSmallPic();
		this.brandId=spu.getBrandId();
		this.categoryId=spu.getCategoryId();
		this.caption=spu.getCaption();
		this.goodsName=spu.getGoodsName();
	}
	@Override
	public String toString() {
		return "SpuEsVo [id=" + id + ", goodsName=" + goodsName + ", brandId=" + brandId + ", caption=" + caption
				+ ", categoryId=" + categoryId + ", smallPic=" + smallPic + ", brandName=" + brandName
				+ ", categoryName=" + categoryName + "]";
	}
	
	
	
}
