package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dawn.angel.dao.ProductDAO;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.service.ProductService;

public class ProductServiceImpl implements ProductService{
	
	private ProductDAO productDAO;
	
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public ProductVO getProductByNo(int prodNo) throws SQLException {
		return productDAO.selectProductByNo(prodNo);
	}

	@Override
	public List<ProductVO> getProductList(int category) throws SQLException {
		return productDAO.selectProductList(category);
	}

	@Override
	public List<ProductVO> getProductListRel(int prodNo) throws SQLException {
		ProductVO product = productDAO.selectProductByNo(prodNo);
		List<ProductVO> prodList = productDAO.selectProductList(product.getCategory());
		List<ProductVO> relList = new ArrayList<ProductVO>();
		
		for(ProductVO prod : prodList) {
			if(prod.getProdNo() >= prodNo) continue;
			relList.add(prod);
			if(relList.size() >= 4) break;
		}
		if(relList.size() < 4) {
			for(ProductVO prod : prodList) {
				if(prod.getProdNo() == prodNo) break;
				relList.add(prod);
				if(relList.size() >= 4) break;
			}
		}
		return relList;
	}

	@Override
	public List<ProductVO> getProductBestList(int category) throws SQLException {
		return productDAO.selectProductBestList(category);
	}

}
