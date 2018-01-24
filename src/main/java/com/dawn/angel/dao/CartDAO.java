package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.CartVO;

public interface CartDAO {
	
	List<CartVO> selectCartListById(String memId) throws SQLException;
	
	void insertCart(CartVO cart) throws SQLException;
	
	void updateQuantity(CartVO cart) throws SQLException;
	
	void deleteCart(int cartNo) throws SQLException;
	
	void deleteCartAll(String memId) throws SQLException;
}
