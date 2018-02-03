package com.dawn.angel.domain;

import java.sql.Timestamp;

public class BaljuVO { // 발주
	private int baljuNo; // 발주번호
	private String baljuSerial; // 발주 일련번호
	private String baljuMemName; // 발주 고객명
	private String baljuMemPhone; // 고객 핸드폰
	private int baljuPrice; // 발주가격
	private Timestamp baljuDate; // 발주일자
	private String baljuSendId; // 발주자 아이디
	private int baljuSendPrice; // 발주자 가질금액
	private String baljuSendName; // 발주자 성명
	private String baljuSendPhone; // 발주자 핸드폰
	private String baljuSendCompany; // 발주자 상호(회사명)
	private String baljuRecId; // 받는자 아이디
	private int baljuRecPrice; // 받는자 받을금액
	private String baljuRecName; // 받는자 성명
	private String baljuRecPhone; // 받는자 핸드폰
	private String baljuRecCompany; // 받는자 상호(회사명)
	private int bdetailNo; // 발주 상세번호
	private int prodNo; // 발주 상품번호
	private String prodName; // 발주 상품명
	private String prodImage; // 발주 상품이미지
	private int quentity; // 발주 상품수량
	private char checkyn; // 발주 확인여부 (확인: y, 미확인: n);
	
	public int getBaljuNo() {
		return baljuNo;
	}
	public void setBaljuNo(int baljuNo) {
		this.baljuNo = baljuNo;
	}
	public int getBaljuPrice() {
		return baljuPrice;
	}
	public void setBaljuPrice(int baljuPrice) {
		this.baljuPrice = baljuPrice;
	}
	public Timestamp getBaljuDate() {
		return baljuDate;
	}
	public void setBaljuDate(Timestamp baljuDate) {
		this.baljuDate = baljuDate;
	}
	public String getBaljuSendId() {
		return baljuSendId;
	}
	public void setBaljuSendId(String baljuSendId) {
		this.baljuSendId = baljuSendId;
	}
	public int getBaljuSendPrice() {
		return baljuSendPrice;
	}
	public void setBaljuSendPrice(int baljuSendPrice) {
		this.baljuSendPrice = baljuSendPrice;
	}
	public String getBaljuSendName() {
		return baljuSendName;
	}
	public void setBaljuSendName(String baljuSendName) {
		this.baljuSendName = baljuSendName;
	}
	public String getBaljuSendPhone() {
		return baljuSendPhone;
	}
	public void setBaljuSendPhone(String baljuSendPhone) {
		this.baljuSendPhone = baljuSendPhone;
	}
	public String getBaljuSendCompany() {
		return baljuSendCompany;
	}
	public void setBaljuSendCompany(String baljuSendCompany) {
		this.baljuSendCompany = baljuSendCompany;
	}
	public String getBaljuRecId() {
		return baljuRecId;
	}
	public void setBaljuRecId(String baljuRecId) {
		this.baljuRecId = baljuRecId;
	}
	public int getBaljuRecPrice() {
		return baljuRecPrice;
	}
	public void setBaljuRecPrice(int baljuRecPrice) {
		this.baljuRecPrice = baljuRecPrice;
	}
	public String getBaljuRecName() {
		return baljuRecName;
	}
	public void setBaljuRecName(String baljuRecName) {
		this.baljuRecName = baljuRecName;
	}
	public String getBaljuRecPhone() {
		return baljuRecPhone;
	}
	public void setBaljuRecPhone(String baljuRecPhone) {
		this.baljuRecPhone = baljuRecPhone;
	}
	public String getBaljuRecCompany() {
		return baljuRecCompany;
	}
	public void setBaljuRecCompany(String baljuRecCompany) {
		this.baljuRecCompany = baljuRecCompany;
	}
	public int getBdetailNo() {
		return bdetailNo;
	}
	public void setBdetailNo(int bdetailNo) {
		this.bdetailNo = bdetailNo;
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
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public int getQuentity() {
		return quentity;
	}
	public void setQuentity(int quentity) {
		this.quentity = quentity;
	}
	public char getCheckyn() {
		return checkyn;
	}
	public void setCheckyn(char checkyn) {
		this.checkyn = checkyn;
	}
	public String getBaljuSerial() {
		return baljuSerial;
	}
	public void setBaljuSerial(String baljuSerial) {
		this.baljuSerial = baljuSerial;
	}
	public String getBaljuMemName() {
		return baljuMemName;
	}
	public void setBaljuMemName(String baljuMemName) {
		this.baljuMemName = baljuMemName;
	}
	public String getBaljuMemPhone() {
		return baljuMemPhone;
	}
	public void setBaljuMemPhone(String baljuMemPhone) {
		this.baljuMemPhone = baljuMemPhone;
	}
	@Override
	public String toString() {
		return "BaljuVO [baljuNo=" + baljuNo + ", baljuSerial=" + baljuSerial + ", baljuMemName=" + baljuMemName
				+ ", baljuMemPhone=" + baljuMemPhone + ", baljuPrice=" + baljuPrice + ", baljuDate=" + baljuDate
				+ ", baljuSendId=" + baljuSendId + ", baljuSendPrice=" + baljuSendPrice + ", baljuSendName="
				+ baljuSendName + ", baljuSendPhone=" + baljuSendPhone + ", baljuSendCompany=" + baljuSendCompany
				+ ", baljuRecId=" + baljuRecId + ", baljuRecPrice=" + baljuRecPrice + ", baljuRecName=" + baljuRecName
				+ ", baljuRecPhone=" + baljuRecPhone + ", baljuRecCompany=" + baljuRecCompany + ", bdetailNo="
				+ bdetailNo + ", prodNo=" + prodNo + ", prodName=" + prodName + ", prodImage=" + prodImage
				+ ", quentity=" + quentity + ", checkyn=" + checkyn + "]";
	}
}
