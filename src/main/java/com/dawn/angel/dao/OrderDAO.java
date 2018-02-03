package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.SearchCriteria;

public interface OrderDAO {
	
	OrderVO selectOrderByNo(int orderNo) throws SQLException;
	
	List<OrderVO> selectOrderDetailList(int orderNo) throws SQLException;
	
	OrderVO selectOrderByNoForGuest(int orderNo) throws SQLException;
	
	List<OrderVO> selectOrderDetailListForGuest(int orderNo) throws SQLException;
	
	void insertOrder(OrderVO order) throws SQLException;
	
	void insertOrderDetail(OrderVO order) throws SQLException;
	
	int selectMaxOrderNo() throws SQLException;
	
	int selectOrderCountById(String memId) throws SQLException;
	
	int selectOrderCountByProd(int prodNo) throws SQLException;
	
	List<OrderVO> selectOrderTotalList() throws SQLException;
	
	List<OrderVO> selectOrderTotalListCri(Criteria cri) throws SQLException;
	
	int selectOrderTotalCount() throws SQLException;
	
	List<OrderVO> selectOrderDepList(Criteria cri) throws SQLException;
	
	int selectOrderDepCount() throws SQLException;
	
	void updateOrderDep(int orderNo) throws SQLException;
	
	List<OrderVO> selectOrderShipList(Criteria cri) throws SQLException;
	
	int selectOrderShipCount() throws SQLException;
	
	void updateOrderShip(int orderNo, int orderState) throws SQLException;
	
	List<OrderVO> selectOrderCancelList(Criteria cri) throws SQLException;
	
	int selectOrderCancelCount() throws SQLException;
	
	void updateOrderCancel(int orderNo, int cancel) throws SQLException;
	
	List<OrderVO> selectOrderListByComplete(SearchCriteria cri) throws SQLException;
	
	int selectOrderListCountByComplete(SearchCriteria cri) throws SQLException;
	
	void updateReviewyn(String orderSerial) throws SQLException;
	
	List<OrderVO> selectOrderListForTotSale(int year, int month) throws SQLException;
	
	List<OrderVO> selectOrderSearchListForPay(int year, int month, SearchCriteria cri) throws SQLException;
	
	int selectOrderSearchListForPayCount(int year, int month, SearchCriteria cri) throws SQLException;
}
