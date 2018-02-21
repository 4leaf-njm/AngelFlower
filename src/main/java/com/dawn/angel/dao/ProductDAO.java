package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ProductRequest;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.SearchCriteria;

public interface ProductDAO {
	
	ProductVO selectProductByNo(int prodNo) throws SQLException;
	
	List<ProductVO> selectProductList(int category) throws SQLException;
	
	List<ProductVO> selectProductListCri(int category, Criteria cri, Integer sort) throws SQLException;
	
	List<ProductVO> selectProductBestList(int category) throws SQLException;
	
	List<ProductVO> selectProductTotalList() throws SQLException;
	
	List<ProductVO> selectProductTotalListCri(Criteria cri) throws SQLException;
	
	List<ProductVO> selectProductSearch(ProductRequest req) throws SQLException;
	
	int selectProductTotalCount() throws SQLException;
	
	void insertProduct(ProductVO product) throws SQLException;
	
	void updateProduct(ProductVO product) throws SQLException;
	
	void deleteProduct(int prodNo) throws SQLException;
	
	List<ProductVO> selectProdListSearch(SearchCriteria cri) throws SQLException;
	
	int selectProdListCount(SearchCriteria cri) throws SQLException;
	
	int selectBestCountByCate(int category) throws SQLException;
	
	int selectProductListCriCount(int category) throws SQLException;
}
