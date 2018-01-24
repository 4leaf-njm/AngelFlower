package com.dawn.angel.domain;

import java.sql.Timestamp;

public class ReviewVO { // 배송 사진 (후기)
	
	private int reviewNo; // 후기 번호
	private String title; // 배송후기 제목
	private String region; // 배송 후기 지역
	private String image; // 배송 후기 사진
	private String prodName; // 상품명
	private int price1; // 상품 판매가
	private int price2; // 상품 회원가
	private int category; // 품목 
	private String memId; // 회원 아이디
	private String memName; // 회원 이름
	private int prodNo; // 상품 번호
	private String comContent; // 상품 후기 내용
	private int comStar; // 상품 후기 만족도 (1~5)
	private String comImage; // 상품 후기 이미지
	private Timestamp comRegdate; // 상품 후기 작성일
	private String comReply; // 상품 후기 답변
	private int type; // 후기 유형 (1 : 배송후기, 2 : 상품후기)
	
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
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public int getComStar() {
		return comStar;
	}
	public void setComStar(int comStar) {
		this.comStar = comStar;
	}
	public String getComImage() {
		return comImage;
	}
	public void setComImage(String comImage) {
		this.comImage = comImage;
	}
	public Timestamp getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(Timestamp comRegdate) {
		this.comRegdate = comRegdate;
	}
	public String getComReply() {
		return comReply;
	}
	public void setComReply(String comReply) {
		this.comReply = comReply;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", title=" + title + ", region=" + region + ", image=" + image
				+ ", prodName=" + prodName + ", price1=" + price1 + ", price2=" + price2 + ", category=" + category
				+ ", memId=" + memId + ", memName=" + memName + ", prodNo=" + prodNo + ", comContent=" + comContent
				+ ", comStar=" + comStar + ", comImage=" + comImage + ", comRegdate=" + comRegdate + ", comReply="
				+ comReply + ", type=" + type + "]";
	}
}
