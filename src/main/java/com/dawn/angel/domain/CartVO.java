package com.dawn.angel.domain;

public class CartVO { // 장바구니
	
	private int cartNo; // 장바구니 번호
	private int quantity; // 수량
	private String memId; // 사용자 아이디
	private int prodNo; // 상품 번호
	private String prodName; // 상품명
	private int prodPrice1; // 상품 판매가
	private int prodPrice2; // 상품 회원가
	private int prodSave; // 상품 적립금
	private String prodImage; // 상품 이미지
	private char useyn; // 사용여부 (장바구니 o : y, 장바구니 x : n)
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	public int getProdSave() {
		return prodSave;
	}
	public void setProdSave(int prodSave) {
		this.prodSave = prodSave;
	}
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public char getUseyn() {
		return useyn;
	}
	public void setUseyn(char useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", quantity=" + quantity + ", memId=" + memId + ", prodNo=" + prodNo
				+ ", prodName=" + prodName + ", prodPrice1=" + prodPrice1 + ", prodPrice2=" + prodPrice2 + ", prodSave="
				+ prodSave + ", prodImage=" + prodImage + ", useyn=" + useyn + "]";
	}
}
