package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dawn.angel.dao.ProductDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ProductRequest;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.SearchCriteria;
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

	@Override
	public List<ProductVO> getProductTotalList() throws SQLException {
		return productDAO.selectProductTotalList();
	}
	
	@Override
	public List<ProductVO> getProductTotalListCri(Criteria cri) throws SQLException {
		return productDAO.selectProductTotalListCri(cri);
	}

	@Override
	public int getProductTotalCount() throws SQLException {
		return productDAO.selectProductTotalCount();
	}

	@Override
	public void addProduct(ProductVO product) throws SQLException {
		productDAO.insertProduct(product);
	}

	@Override
	public void modifyProduct(ProductVO product) throws SQLException {
		productDAO.updateProduct(product);
	}

	@Override
	public void removeProduct(int prodNo) throws SQLException {
		productDAO.deleteProduct(prodNo);
	}

	@Override
	public List<ProductVO> getProductListSearch(SearchCriteria cri) throws SQLException {
		return productDAO.selectProdListSearch(cri);
	}

	@Override
	public int getProductListSearchCount(SearchCriteria cri) throws SQLException {
		return productDAO.selectProdListCount(cri);
	}

	@Override
	public int getBestCountByCate(int category) throws SQLException {
		return productDAO.selectBestCountByCate(category);
	}

	@Override
	public List<ProductVO> getProductListCri(int category, Criteria cri, Integer sort) throws SQLException {
		return productDAO.selectProductListCri(category, cri, sort);
	}

	@Override
	public int getProductListCriCount(int category) throws SQLException {
		return productDAO.selectProductListCriCount(category);
	}

	@Override
	public List<ProductVO> getProductSearch(ProductRequest req) throws SQLException {
		return productDAO.selectProductSearch(req);
	}

}
