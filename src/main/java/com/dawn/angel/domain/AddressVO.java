package com.dawn.angel.domain;

public class AddressVO { // 주소
	private int addrNo; 
	private String sido; // 시도
	private String gugun; // 구군
	
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	@Override
	public String toString() {
		return "AddressVO [addrNo=" + addrNo + ", sido=" + sido + ", gugun=" + gugun + "]";
	}
}
