package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.WishVO;

public interface WishDAO {
	
	List<WishVO> selectWishListById(String memId) throws SQLException;
	
	WishVO selectWishByNo(int wishNo) throws SQLException;
	
	void insertWish(WishVO wish) throws SQLException;
	
	void deleteWish(int wishNo) throws SQLException;
}
