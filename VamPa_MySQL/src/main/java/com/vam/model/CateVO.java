package com.vam.model;

import java.util.Objects;

public class CateVO {
	
	/* 카테고리 등급 */
	private int tier;
	/* 카테고리 이름 */
	private String cateName;
	/* 카테고리 넘버 */
	private String cateCode;
	/* 상위 카테고리 */
	private String cateParent;

	public CateVO() {}

	public int getTier() {
		return tier;
	}

	public void setTier(int tier) {
		this.tier = tier;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateParent() {
		return cateParent;
	}

	public void setCateParent(String cateParent) {
		this.cateParent = cateParent;
	}

	public CateVO(int tier, String cateName, String cateCode, String cateParent) {
		super();
		this.tier = tier;
		this.cateName = cateName;
		this.cateCode = cateCode;
		this.cateParent = cateParent;
	}

	@Override
	public String toString() {
		return "CateVO [tier=" + tier + ", cateName=" + cateName + ", cateCode=" + cateCode + ", cateParent="
				+ cateParent + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cateCode, cateName, cateParent, tier);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CateVO other = (CateVO) obj;
		return Objects.equals(cateCode, other.cateCode) && Objects.equals(cateName, other.cateName)
				&& Objects.equals(cateParent, other.cateParent) && tier == other.tier;
	}
	
}
