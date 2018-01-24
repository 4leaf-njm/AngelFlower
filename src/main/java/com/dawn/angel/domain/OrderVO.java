package com.dawn.angel.domain;

import java.sql.Timestamp;

public class OrderVO {
	private int orderNo; // 주문 번호
	private String memId; // 주문자 아이디
	private String memName; // 주문자 성명
	private String memPhone; // 주문자 핸드폰
	private String memEmail; // 주문자 이메일
	private String receiveName; // 받는사람 이름
	private String receivePhone; // 받는사람 핸드폰
	private String receiveAddr; // 받는사람 주소
	private String orderMsg1; // 경조사 문구
	private String orderMsg2; // 보내는 사람 
	private String orderRequest; // 요청사항
	private Timestamp hopeDate; // 희망 배송일
	private Timestamp orderDate; // 주문일
	private String orderWay; // 결제 방법 
	private String orderState; // 주문 상태
	private int useSave; // 사용한 적립금
	private int odetailNo; // 주문상세 번호
	private int prodNo; // 상품 번호
	private int quantity; // 주문 수량
	private String prodName; // 상품명
	private int prodPrice1; // 상품 판매가
	private int prodPrice2; // 상품 회원가
	private int prodSave; // 상품 적립금
	private String prodImage; // 상품 이미지
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getReceivePhone() {
		return receivePhone;
	}
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}
	public String getReceiveAddr() {
		return receiveAddr;
	}
	public void setReceiveAddr(String receiveAddr) {
		this.receiveAddr = receiveAddr;
	}
	public String getOrderMsg1() {
		return orderMsg1;
	}
	public void setOrderMsg1(String orderMsg1) {
		this.orderMsg1 = orderMsg1;
	}
	public String getOrderMsg2() {
		return orderMsg2;
	}
	public void setOrderMsg2(String orderMsg2) {
		this.orderMsg2 = orderMsg2;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	public Timestamp getHopeDate() {
		return hopeDate;
	}
	public void setHopeDate(Timestamp hopeDate) {
		this.hopeDate = hopeDate;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderWay() {
		return orderWay;
	}
	public void setOrderWay(String orderWay) {
		this.orderWay = orderWay;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public int getUseSave() {
		return useSave;
	}
	public void setUseSave(int useSave) {
		this.useSave = useSave;
	}
	public int getOdetailNo() {
		return odetailNo;
	}
	public void setOdetailNo(int odetailNo) {
		this.odetailNo = odetailNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", memId=" + memId + ", memName=" + memName + ", memPhone=" + memPhone
				+ ", memEmail=" + memEmail + ", receiveName=" + receiveName + ", receivePhone=" + receivePhone
				+ ", receiveAddr=" + receiveAddr + ", orderMsg1=" + orderMsg1 + ", orderMsg2=" + orderMsg2
				+ ", orderRequest=" + orderRequest + ", hopeDate=" + hopeDate + ", orderDate=" + orderDate
				+ ", orderWay=" + orderWay + ", orderState=" + orderState + ", useSave=" + useSave + ", odetailNo="
				+ odetailNo + ", prodNo=" + prodNo + ", quantity=" + quantity + ", prodName=" + prodName
				+ ", prodPrice1=" + prodPrice1 + ", prodPrice2=" + prodPrice2 + ", prodSave=" + prodSave
				+ ", prodImage=" + prodImage + "]";
	}
}
