package com.dawn.angel.domain;

import java.sql.Timestamp;

public class ReviewVO { // 배송 사진 (후기)
	
	private int reviewNo; // 후기 번호
	private String revTitle; // 배송후기 제목
	private String revRegion; // 배송 후기 지역
	private String revImage; // 배송 후기 사진
	private String revContent; // 배송 후기 내용
	private String revProd; // 배송 후기 상품
	private int revPrice; // 배송 후기 상품 가격
	private String memId; // 회원 아이디
	private String prodName; // 상품명
	private int prodNo; // 상품 번호
	private int prodPrice1; // 상품 판매가
	private int prodPrice2; // 상품 회원가
	private String comContent; // 상품 후기 내용
	private int comStar; // 상품 후기 만족도 (1~5)
	private String comImage; // 상품 후기 이미지
	private Timestamp comRegdate; // 상품 후기 작성일
	private String comReply; // 상품 후기 답변
	private int category; // 상품 카테고리
	private int type; // 후기 유형 (1 : 배송후기, 2 : 상품후기)
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevRegion() {
		return revRegion;
	}
	public void setRevRegion(String revRegion) {
		this.revRegion = revRegion;
	}
	public String getRevImage() {
		return revImage;
	}
	public void setRevImage(String revImage) {
		this.revImage = revImage;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public String getRevProd() {
		return revProd;
	}
	public void setRevProd(String revProd) {
		this.revProd = revProd;
	}
	public int getRevPrice() {
		return revPrice;
	}
	public void setRevPrice(int revPrice) {
		this.revPrice = revPrice;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	public int getProdPrice1() {
		return prodPrice1;
	}
	public void setProdPrice1(int prodPrice1) {
		this.prodPrice1 = prodPrice1;
	}
	public int getProdPrice2() {
		return prodPrice2;
	}
	public void setProdPrice2(int prodPrice2) {
		this.prodPrice2 = prodPrice2;
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
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", revTitle=" + revTitle + ", revRegion=" + revRegion + ", revImage="
				+ revImage + ", revContent=" + revContent + ", revProd=" + revProd + ", revPrice=" + revPrice
				+ ", prodName=" + prodName + ", memId=" + memId + ", prodNo=" + prodNo + ", prodPrice1=" + prodPrice1
				+ ", prodPrice2=" + prodPrice2 + ", comContent=" + comContent + ", comStar=" + comStar + ", comImage="
				+ comImage + ", comRegdate=" + comRegdate + ", comReply=" + comReply + ", category=" + category
				+ ", type=" + type + "]";
	}
}