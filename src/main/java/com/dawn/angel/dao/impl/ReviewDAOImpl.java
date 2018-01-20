package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.ReviewDAO;
import com.dawn.angel.domain.ReviewVO;

public class ReviewDAOImpl implements ReviewDAO{
	
	private static final String NAMESPACE = "Review-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReviewVO> selectReviewListByCate(int category) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectReviewListByCate", category);
	}

}
