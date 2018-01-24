package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.OrderVO;

public interface OrderService {
	
	void insertOrder(OrderVO order) throws SQLException;
	
	void insertOrderForGuest(OrderVO order, List<CartVO> cartList) throws SQLException;
	
	OrderVO getOrderByNo(int orderNo) throws SQLException;
	
	List<OrderVO> getOrderDetailList(int orderNo) throws SQLException;
	
	OrderVO getOrderByNoForGuest(int orderNo) throws SQLException;
	
	List<OrderVO> getOrderDetailListForGuest(int orderNo) throws SQLException;
	
	int getMaxOrderNo() throws SQLException;
}
