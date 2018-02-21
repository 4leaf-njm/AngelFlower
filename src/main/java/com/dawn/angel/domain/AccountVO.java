package com.dawn.angel.domain;

public class AccountVO { // 계좌
	private int accNo; // 계좌 고유번호
	private String accBank; // 은행명
	private String accNumber; // 계좌번호
	private String accName; // 예금주
	
	public int getAccNo() {
		return accNo;
	}
	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}
	public String getAccBank() {
		return accBank;
	}
	public void setAccBank(String accBank) {
		this.accBank = accBank;
	}
	public String getAccNumber() {
		return accNumber;
	}
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	@Override
	public String toString() {
		return "AccountVO [accNo=" + accNo + ", accBank=" + accBank + ", accNumber=" + accNumber + ", accName="
				+ accName + "]";
	}
}
