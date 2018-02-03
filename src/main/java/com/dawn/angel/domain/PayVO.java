package com.dawn.angel.domain;

public class PayVO { // 정산
	private int orderCount; // 주문 건수
	private int orderMoney; // 주문 금액
	private int compleCount; // 구매 확정건
	private int totalMoney; // 총 정산금액
	private int sendCount; // 발주 신청건수
	private int totalSendMoney; // 총 발주금
	private int sendMoney; // 총 가진금액
	private int recCount; // 발주 받은건수
	private int totalRecMoney; // 총 받은금액
	private int totalBaljuMoney; // 총 발주 정산금액
	
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(int orderMoney) {
		this.orderMoney = orderMoney;
	}
	public int getCompleCount() {
		return compleCount;
	}
	public void setCompleCount(int compleCount) {
		this.compleCount = compleCount;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getSendCount() {
		return sendCount;
	}
	public void setSendCount(int sendCount) {
		this.sendCount = sendCount;
	}
	public int getTotalSendMoney() {
		return totalSendMoney;
	}
	public void setTotalSendMoney(int totalSendMoney) {
		this.totalSendMoney = totalSendMoney;
	}
	public int getSendMoney() {
		return sendMoney;
	}
	public void setSendMoney(int sendMoney) {
		this.sendMoney = sendMoney;
	}
	public int getRecCount() {
		return recCount;
	}
	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}
	public int getTotalRecMoney() {
		return totalRecMoney;
	}
	public void setTotalRecMoney(int totalRecMoney) {
		this.totalRecMoney = totalRecMoney;
	}
	public int getTotalBaljuMoney() {
		return totalBaljuMoney;
	}
	public void setTotalBaljuMoney(int totalBaljuMoney) {
		this.totalBaljuMoney = totalBaljuMoney;
	}
	@Override
	public String toString() {
		return "PayVO [orderCount=" + orderCount + ", orderMoney=" + orderMoney + ", compleCount=" + compleCount
				+ ", totalMoney=" + totalMoney + ", sendCount=" + sendCount + ", totalSendMoney=" + totalSendMoney
				+ ", sendMoney=" + sendMoney + ", recCount=" + recCount + ", totalRecMoney=" + totalRecMoney
				+ ", totalBaljuMoney=" + totalBaljuMoney + "]";
	}
}
