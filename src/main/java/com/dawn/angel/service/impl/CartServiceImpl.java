package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.CartDAO;
import com.dawn.angel.dao.WishDAO;
import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.WishVO;
import com.dawn.angel.service.CartService;

public class CartServiceImpl implements CartService {
	
	private CartDAO cartDAO;
	
	private WishDAO wishDAO;
	
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}

	public void setWishDAO(WishDAO wishDAO) {
		this.wishDAO = wishDAO;
	}

	@Override
	public List<CartVO> getCartListById(String memId) throws SQLException {
		return cartDAO.selectCartListById(memId);
	}

	@Override
	public void addCart(CartVO cart) throws SQLException {
		cartDAO.insertCart(cart);
	}

	@Override
	public void modifyQuantity(CartVO cart) throws SQLException {
		cartDAO.updateQuantity(cart);
	}

	@Override
	public void removeCart(int cartNo) throws SQLException {
		cartDAO.deleteCart(cartNo);
	}
	
	@Override
	public void removeCartList(List<Integer> cartList) throws SQLException {
		for(int cartNo : cartList) {
			cartDAO.deleteCart(cartNo);
		}
	}

	@Override
	public void removeCartAll(String memId) throws SQLException {
		cartDAO.deleteCartAll(memId);
	}

	@Override
	public void addCartFromWish(WishVO wish) throws SQLException {
		CartVO cart = new CartVO();
		cart.setQuantity(wish.getQuantity());
		cart.setMemId(wish.getMemId());
		cart.setProdNo(wish.getProdNo());
		
		cartDAO.insertCart(cart);
		wishDAO.deleteWish(wish.getWishNo());
	}

	@Override
	public List<WishVO> getWishListById(String memId) throws SQLException {
		return wishDAO.selectWishListById(memId);
	}

	@Override
	public void addWish(WishVO wish) throws SQLException {
		wishDAO.insertWish(wish);
	}

	@Override
	public void removeWish(int wishNo) throws SQLException {
		wishDAO.deleteWish(wishNo);
	}

	@Override
	public WishVO getWishByNo(int wishNo) throws SQLException {
		return wishDAO.selectWishByNo(wishNo);
	}

}
