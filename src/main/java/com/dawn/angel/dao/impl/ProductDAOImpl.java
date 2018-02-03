package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.ProductDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.SearchCriteria;

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

	@Override
	public List<ProductVO> selectProductTotalList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectProductTotalList");
	}
	
	@Override
	public List<ProductVO> selectProductTotalListCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectProductTotalList", null, rowBounds);
	}

	@Override
	public int selectProductTotalCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectProductTotalCount");
	}

	@Override
	public void insertProduct(ProductVO product) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertProduct", product);
	}

	@Override
	public void updateProduct(ProductVO product) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateProduct", product);
	}

	@Override
	public void deleteProduct(int prodNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteProduct", prodNo);
	}

	@Override
	public List<ProductVO> selectProdListSearch(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectProdListSearch", cri, rowBounds);
	}

	@Override
	public int selectProdListCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectProdListSearchCount", cri);
	}

	@Override
	public int selectBestCountByCate(int category) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBestCountByCate", category);
	}
	
}
