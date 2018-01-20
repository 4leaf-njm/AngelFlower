package com.dawn.angel.domain;

public class ReviewVO { // 배송 사진 (후기)
	
	private int reviewNo; // 후기 번호
	private String region; // 배송 지역
	private String image; // 배송 사진
	private String prodName; // 상품명
	private int price1; // 상품 판매가
	private int price2; // 상품 회원가
	private int category; // 품목 
	private String memId; // 회원 아이디
	private int prodNo; // 상품 번호
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", region=" + region + ", image=" + image + ", prodName=" + prodName
				+ ", price1=" + price1 + ", price2=" + price2 + ", category=" + category + ", memId=" + memId
				+ ", prodNo=" + prodNo + "]";
	}
}
