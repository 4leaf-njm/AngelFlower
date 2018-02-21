package com.dawn.angel.domain;

public class BannerVO { // 이벤트 배너
	private int bannerNo; // 배너 번호
	private String bannerTitle; // 배너 제목
	private String bannerImage; // 배너 이미지
	private int rank; // 배너 순서
	
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getBannerTitle() {
		return bannerTitle;
	}
	public void setBannerTitle(String bannerTitle) {
		this.bannerTitle = bannerTitle;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "BannerVO [bannerNo=" + bannerNo + ", bannerTitle=" + bannerTitle + ", bannerImage=" + bannerImage
				+ ", rank=" + rank + "]";
	}
}
