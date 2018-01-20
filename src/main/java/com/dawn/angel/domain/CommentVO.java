package com.dawn.angel.domain;

import java.sql.Timestamp;

public class CommentVO { // 상품 후기
	
	private int comNo; // 후기 번호
	private String content; // 후기 내용
	private int star; // 만족도 (1~5)
	private String image; // 후기 이미지
	private Timestamp regdate; // 작성일
	private String reply; // 답변 
	private String memId; // 작성자 아이디
	private int prodNo; // 상품 번호
	
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
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
	@Override
	public String toString() {
		return "CommentVO [comNo=" + comNo + ", content=" + content + ", star=" + star + ", image=" + image
				+ ", regdate=" + regdate + ", reply=" + reply + ", memId=" + memId + ", prodNo=" + prodNo + "]";
	}
}
