package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.BannerVO;

public interface BannerDAO {
	
	List<BannerVO> selectBannerList() throws SQLException;
	
	BannerVO selectBannerByNo(int bannerNo) throws SQLException;
	
	void updateBanner(BannerVO banner) throws SQLException;
	
}
