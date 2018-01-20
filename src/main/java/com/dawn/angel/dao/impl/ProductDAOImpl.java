package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.ProductDAO;
import com.dawn.angel.domain.ProductVO;

public class ProductDAOImpl implements ProductDAO {

	private static final String NAMESPACE = "Product-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ProductVO selectProductByNo(int prodNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectProductByNo", prodNo);
	}

	@Override
	public List<ProductVO> selectProductList(int category) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectProductList", category);
	}

	@Override
	public List<ProductVO> selectProductBestList(int category) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectProductBestList", category);
	}
	
}
