package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.WishVO;

public interface CartService {

	List<CartVO> getCartListById(String memId) throws SQLException;
	
	void addCart(CartVO cart) throws SQLException;
	
	void modifyQuantity(CartVO cart) throws SQLException;
	
	void removeCart(int cartNo) throws SQLException;
	
	void removeCartList(List<Integer> cartList) throws SQLException;
	
	void removeCartAll(String memId) throws SQLException;
	
	void addCartFromWish(WishVO wish) throws SQLException;
	
	List<WishVO> getWishListById(String memId) throws SQLException;
	
	WishVO getWishByNo(int wishNo) throws SQLException;
	
	void addWish(WishVO wish) throws SQLException;
	
	void removeWish(int wishNo) throws SQLException;
	
}
