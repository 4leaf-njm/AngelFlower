package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.BannerDAO;
import com.dawn.angel.domain.BannerVO;

public class BannerDAOImpl implements BannerDAO {

	private static final String NAMESPACE = "Banner-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BannerVO> selectBannerList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectBannerList");
	}

	@Override
	public BannerVO selectBannerByNo(int bannerNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBannerByNo", bannerNo);
	}

	@Override
	public void updateBanner(BannerVO banner) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateBanner", banner);
	}

}
