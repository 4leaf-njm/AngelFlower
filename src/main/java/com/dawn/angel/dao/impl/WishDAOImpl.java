package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.WishDAO;
import com.dawn.angel.domain.WishVO;

public class WishDAOImpl implements WishDAO{
	
	private static final String NAMESPACE = "Wish-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<WishVO> selectWishListById(String memId) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectWishListById", memId);
	}

	@Override
	public void insertWish(WishVO wish) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertWish", wish);
	}

	@Override
	public void deleteWish(int wishNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteWish", wishNo);
	}

	@Override
	public WishVO selectWishByNo(int wishNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectWishByNo", wishNo);
	}

}
