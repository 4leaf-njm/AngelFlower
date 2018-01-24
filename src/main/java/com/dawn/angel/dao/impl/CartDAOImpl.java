package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.CartDAO;
import com.dawn.angel.domain.CartVO;

public class CartDAOImpl implements CartDAO{
	
	private static final String NAMESPACE = "Cart-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CartVO> selectCartListById(String memId) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCartListById", memId);
	}

	@Override
	public void insertCart(CartVO cart) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertCart", cart);
	}

	@Override
	public void updateQuantity(CartVO cart) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateQuantity", cart);
	}

	@Override
	public void deleteCart(int cartNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteCart", cartNo);
	}

	@Override
	public void deleteCartAll(String memId) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteCartAll", memId);
	}

}
