package com.dawn.angel.domain;

public class ProductRequest {
	
	private String pname;
	private String p1;
	private String p2;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getP1() {
		return p1;
	}
	public void setP1(String p1) {
		this.p1 = p1;
	}
	public String getP2() {
		return p2;
	}
	public void setP2(String p2) {
		this.p2 = p2;
	}
	@Override
	public String toString() {
		return "ProductRequest [pname=" + pname + ", p1=" + p1 + ", p2=" + p2 + "]";
	}
}
