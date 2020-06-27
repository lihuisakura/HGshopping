package com.lihui.hgshop.domain;

public class ConditionSpu extends Spu{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer index;
	
	private Integer rank;

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ConditionSpu(Integer id, String goodsName, String isMarketable, Integer brandId, String caption,
			Integer categoryId, String smallPic, Brand brand, Category category, Integer index, Integer rank) {
		super(id, goodsName, isMarketable, brandId, caption, categoryId, smallPic, brand, category);
		this.index = index;
		this.rank = rank;
	}

	
	public ConditionSpu() {
		super();
	}

	public ConditionSpu(Integer id, String goodsName, String isMarketable, Integer brandId, String caption,
			Integer categoryId, String smallPic, Brand brand, Category category) {
		super(id, goodsName, isMarketable, brandId, caption, categoryId, smallPic, brand, category);
	}

	@Override
	public String toString() {
		return "ConditionSpu [index=" + index + ", rank=" + rank + "]";
	}
	
	
	
	
}
