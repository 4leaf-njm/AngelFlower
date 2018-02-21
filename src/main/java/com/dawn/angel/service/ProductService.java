package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ProductRequest;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.SearchCriteria;

public interface ProductService {
	
	ProductVO getProductByNo(int prodNo) throws SQLException;
	
	List<ProductVO> getProductList(int category) throws SQLException;
	
	List<ProductVO> getProductListCri(int category, Criteria cri, Integer sort) throws SQLException;
	
	List<ProductVO> getProductListRel(int prodNo) throws SQLException;
	
	List<ProductVO> getProductBestList(int category) throws SQLException;
	
	List<ProductVO> getProductTotalListCri(Criteria cri) throws SQLException;
	
	List<ProductVO> getProductTotalList() throws SQLException;
	
	List<ProductVO> getProductSearch(ProductRequest req) throws SQLException;
	
	int getProductTotalCount() throws SQLException;
	
	void addProduct(ProductVO product) throws SQLException;
	
	void modifyProduct(ProductVO product) throws SQLException;
	
	void removeProduct(int prodNo) throws SQLException;
	
	List<ProductVO> getProductListSearch(SearchCriteria cri) throws SQLException;
	
	int getProductListSearchCount(SearchCriteria cri) throws SQLException;

	int getBestCountByCate(int category) throws SQLException;
	
	int getProductListCriCount(int category) throws SQLException;
}
