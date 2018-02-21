package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PayVO;
import com.dawn.angel.domain.SearchCriteria;

public interface OrderService {
	
	void insertOrder(OrderVO order) throws SQLException;
	
	void insertOrderForGuest(OrderVO order, List<CartVO> cartList) throws SQLException;
	
	OrderVO getOrderByNo(int orderNo) throws SQLException;
	
	List<OrderVO> getOrderDetailList(int orderNo) throws SQLException;
	
	int getMaxOrderNo() throws SQLException;
	
	int getOrderCountById(String memId) throws SQLException;
	
	int getOrderCountByProd(int prodNo) throws SQLException;
	
	List<OrderVO> getOrderTotalListCri(Criteria cri, String adminId) throws SQLException;
	
	List<OrderVO> getOrderTotalList() throws SQLException;
	
	int getOrderTotalCount() throws SQLException;
	
	List<OrderVO> getOrderDepList(Criteria cri, String adminId) throws SQLException;
	
	int getOrderDepCount() throws SQLException;
	
	void modifyOrderDep(int orderNo) throws SQLException;
	
	List<OrderVO> getOrderShipList(Criteria cri, String adminId) throws SQLException;
	
	int getOrderShipCount() throws SQLException;
	
	void modifyOrderShip(int orderNo, int orderState) throws SQLException;
	
	List<OrderVO> getOrderCancelList(Criteria cri) throws SQLException;
	
	int getOrderCancelCount() throws SQLException;
	
	void modifyOrderCancel(int orderNo, int cancel) throws SQLException;
	
	List<OrderVO> getOrderListByComplete(SearchCriteria cri) throws SQLException;
	
	int getOrderListCountByComplete(SearchCriteria cri) throws SQLException;
	
	List<PayVO> getPayListForTotSale(int year) throws SQLException;
	
	List<OrderVO> getOrderListForPay(int year, int month, SearchCriteria cri) throws SQLException;
	
	int getOrderSearchListForPayCount(int year, int month, SearchCriteria cri) throws SQLException;
	
	List<OrderVO> getMyOrderList(String memId) throws SQLException;
	
	int getOrderTotalCountForBalju(String adminId) throws SQLException;
	
	int getOrderDepCountForBalju(String adminId) throws SQLException;
	
	int getOrderShipCountForBalju(String adminId) throws SQLException;
	
	List<OrderVO> getOrderTotalListForBalju(String adminId) throws SQLException;
	
	Map<String, Object> getOrderListThisMonth() throws SQLException;
	
	Map<String, Object> getOrderListThisDay() throws SQLException;
}
