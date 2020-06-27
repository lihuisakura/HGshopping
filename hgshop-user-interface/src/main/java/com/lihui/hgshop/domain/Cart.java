package com.lihui.hgshop.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Cart implements Serializable{

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer uid;
	private Integer skuid;
	private Integer pnum;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
	private Date createtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
	private Date updatetime;
	private BigDecimal sumTotal;
	
	private Sku sku;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getSkuid() {
		return skuid;
	}

	public void setSkuid(Integer skuid) {
		this.skuid = skuid;
	}

	public Integer getPnum() {
		return pnum;
	}

	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public BigDecimal getSumTotal() {
		return sumTotal;
	}

	public void setSumTotal(BigDecimal sumTotal) {
		this.sumTotal = sumTotal;
	}

	public Sku getSku() {
		return sku;
	}

	public void setSku(Sku sku) {
		this.sku = sku;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Cart(Integer id, Integer uid, Integer skuid, Integer pnum, Date createtime, Date updatetime,
			BigDecimal sumTotal, Sku sku) {
		super();
		this.id = id;
		this.uid = uid;
		this.skuid = skuid;
		this.pnum = pnum;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.sumTotal = sumTotal;
		this.sku = sku;
	}

	public Cart() {
		super();
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", uid=" + uid + ", skuid=" + skuid + ", pnum=" + pnum + ", createtime=" + createtime
				+ ", updatetime=" + updatetime + ", sumTotal=" + sumTotal + ", sku=" + sku + "]";
	}
	
	

}
