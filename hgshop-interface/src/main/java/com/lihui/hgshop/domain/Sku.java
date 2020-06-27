package com.lihui.hgshop.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Sku implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6065369561667435192L;
	private Integer id;
	private String title;//标题
	private String sellPoint;//卖点
	private BigDecimal price;//在售价格
	private Integer stockCount;//库存数量
	private String barcode;//条形码
	private String image;//图片
	private Integer status;//状态
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createTime;//发布时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateTime;//最后更新时间
	private BigDecimal costPrice;//成本价格
	private BigDecimal marketPrice;//市场价格
	private Integer spuId;//spu
	private String cartThumbnail;//购物车中小图
	
	private Spu spu;
	
	private List<SpecOption> specOptions;
	
	
	
	public List<SpecOption> getSpecOptions() {
		return specOptions;
	}

	public void setSpecOptions(List<SpecOption> specOptions) {
		this.specOptions = specOptions;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSellPoint() {
		return sellPoint;
	}

	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getStockCount() {
		return stockCount;
	}

	public void setStockCount(Integer stockCount) {
		this.stockCount = stockCount;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(BigDecimal marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Integer getSpuId() {
		return spuId;
	}

	public void setSpuId(Integer spuId) {
		this.spuId = spuId;
	}

	public String getCartThumbnail() {
		return cartThumbnail;
	}

	public void setCartThumbnail(String cartThumbnail) {
		this.cartThumbnail = cartThumbnail;
	}

	public Spu getSpu() {
		return spu;
	}

	public void setSpu(Spu spu) {
		this.spu = spu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	


	public Sku(Integer id, String title, String sellPoint, BigDecimal price, Integer stockCount, String barcode,
			String image, Integer status, Date createTime, Date updateTime, BigDecimal costPrice,
			BigDecimal marketPrice, Integer spuId, String cartThumbnail, Spu spu, List<SpecOption> specOptions) {
		super();
		this.id = id;
		this.title = title;
		this.sellPoint = sellPoint;
		this.price = price;
		this.stockCount = stockCount;
		this.barcode = barcode;
		this.image = image;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.costPrice = costPrice;
		this.marketPrice = marketPrice;
		this.spuId = spuId;
		this.cartThumbnail = cartThumbnail;
		this.spu = spu;
		this.specOptions = specOptions;
	}

	public Sku() {
		super();
	}

	@Override
	public String toString() {
		return "Sku [id=" + id + ", title=" + title + ", sellPoint=" + sellPoint + ", price=" + price + ", stockCount="
				+ stockCount + ", barcode=" + barcode + ", image=" + image + ", status=" + status + ", createTime="
				+ createTime + ", updateTime=" + updateTime + ", costPrice=" + costPrice + ", marketPrice="
				+ marketPrice + ", spuId=" + spuId + ", cartThumbnail=" + cartThumbnail + ", spu=" + spu
				+ ", specOptions=" + specOptions + "]";
	}

	
	
	
	
	
}
