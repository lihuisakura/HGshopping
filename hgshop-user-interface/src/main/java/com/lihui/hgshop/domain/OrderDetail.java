package com.lihui.hgshop.domain;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 
 * @ClassName: OrderDetail 
 * @Description: 订单详情
 * @author:lh 
 * @date: 2020年4月8日 下午4:21:40
 */
public class OrderDetail implements Serializable{

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer skuid;//商品库存id
	private BigDecimal total;//总价格
	private Integer oid;//订单id
	private Integer pnum;//购买数量
	
	private String title;
	private String sellPoint;
	private BigDecimal price;
	private String cartThumbnail;
	
	
	public String getCartThumbnail() {
		return cartThumbnail;
	}
	public void setCartThumbnail(String cartThumbnail) {
		this.cartThumbnail = cartThumbnail;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSkuid() {
		return skuid;
	}
	public void setSkuid(Integer skuid) {
		this.skuid = skuid;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getPnum() {
		return pnum;
	}
	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public OrderDetail(Integer id, Integer skuid, BigDecimal total, Integer oid, Integer pnum, String title,
			String sellPoint, BigDecimal price, String cartThumbnail) {
		super();
		this.id = id;
		this.skuid = skuid;
		this.total = total;
		this.oid = oid;
		this.pnum = pnum;
		this.title = title;
		this.sellPoint = sellPoint;
		this.price = price;
		this.cartThumbnail = cartThumbnail;
	}
	public OrderDetail() {
		super();
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", skuid=" + skuid + ", total=" + total + ", oid=" + oid + ", pnum=" + pnum
				+ ", title=" + title + ", sellPoint=" + sellPoint + ", price=" + price + ", cartThumbnail="
				+ cartThumbnail + "]";
	}
	
	
	
	
}
