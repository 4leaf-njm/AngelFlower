package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.ProductVO;

public interface ProductDAO {
	
	ProductVO selectProductByNo(int prodNo) throws SQLException;
	
	List<ProductVO> selectProductList(int category) throws SQLException;
	
	List<ProductVO> selectProductBestList(int category) throws SQLException;
}
