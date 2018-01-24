package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.OrderVO;

public interface OrderDAO {
	
	OrderVO selectOrderByNo(int orderNo) throws SQLException;
	
	List<OrderVO> selectOrderDetailList(int orderNo) throws SQLException;
	
	OrderVO selectOrderByNoForGuest(int orderNo) throws SQLException;
	
	List<OrderVO> selectOrderDetailListForGuest(int orderNo) throws SQLException;
	
	void insertOrder(OrderVO order) throws SQLException;
	
	void insertOrderDetail(OrderVO order) throws SQLException;
	
	int selectMaxOrderNo() throws SQLException;
}
