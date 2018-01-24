package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.ReviewDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;

public class ReviewDAOImpl implements ReviewDAO{
	
	private static final String NAMESPACE = "Review-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReviewVO> selectReviewListByCate(Criteria cri, int category, int type) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("category", category);
		params.put("type", type);
		
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectReviewListByCate", params, rowBounds);
	}

	@Override
	public int selectReviewListCount(int category, int type) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("category", category);
		params.put("type", type);
		
		return sqlSession.selectOne(NAMESPACE + ".selectReviewListCount", params);
	}

}
