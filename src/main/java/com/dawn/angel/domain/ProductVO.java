package com.dawn.angel.domain;

public class ProductVO { // 상품
	
	private int prodNo; // 상품번호 
	private String name; // 상품명
	private int realprice; // 상품 원가
	private int price1; // 상품 판매가
	private int price2; // 상품 회원가
	private int save; // 상품 적립금
	private String info; // 상품 정보
	private String image; // 상품 이미지
	private int category; // 품명
	private char bestyn; // 베스트 여부 (베스트 o: y, 베스트 x: n) 
	private char useyn; // 사용여부 (사용 : y, 미사용 : n)
	private int orderCount; // 판매량
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getSave() {
		return save;
	}
	public void setSave(int save) {
		this.save = save;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public char getUseyn() {
		return useyn;
	}
	public void setUseyn(char useyn) {
		this.useyn = useyn;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public char getBestyn() {
		return bestyn;
	}
	public void setBestyn(char bestyn) {
		this.bestyn = bestyn;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getRealprice() {
		return realprice;
	}
	public void setRealprice(int realprice) {
		this.realprice = realprice;
	}
	@Override
	public String toString() {
		return "ProductVO [prodNo=" + prodNo + ", name=" + name + ", realprice=" + realprice + ", price1=" + price1
				+ ", price2=" + price2 + ", save=" + save + ", info=" + info + ", image=" + image + ", category="
				+ category + ", bestyn=" + bestyn + ", useyn=" + useyn + ", orderCount=" + orderCount + "]";
	}
}
