package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.ProductVO;

public interface ProductService {
	
	ProductVO getProductByNo(int prodNo) throws SQLException;
	
	List<ProductVO> getProductList(int category) throws SQLException;
	
	List<ProductVO> getProductListRel(int prodNo) throws SQLException;
	
	List<ProductVO> getProductBestList(int category) throws SQLException;
}
