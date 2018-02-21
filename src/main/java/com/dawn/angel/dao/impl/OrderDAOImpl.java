package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.SearchCriteria;

public class OrderDAOImpl implements OrderDAO{
	
	private static final String NAMESPACE = "Order-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public OrderVO selectOrderByNo(int orderNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderByNo", orderNo);
	}

	@Override
	public List<OrderVO> selectOrderDetailList(int orderNo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderDetailList", orderNo);
	}

	@Override
	public void insertOrder(OrderVO order) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String orderWay = order.getOrderWay(); 
		int orderState;
		if(orderWay.equals("무통장입금") || orderWay.equals("가상계좌") || orderWay.equals("발주")) {
			orderState = 1;
		} else {
			orderState = 2;
		}
		params.put("order", order);
		params.put("orderState", orderState);
		
		sqlSession.update(NAMESPACE + ".insertOrder", params);
	}

	@Override
	public void insertOrderDetail(OrderVO order) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertOrderDetail", order);
	}

	@Override
	public int selectMaxOrderNo() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMaxOrderNo");
	}

	@Override
	public int selectOrderCountById(String memId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderCountById", memId);
	}

	@Override
	public int selectOrderCountByProd(int prodNo) throws SQLException {
		Integer count = sqlSession.selectOne(NAMESPACE + ".selectOrderCountByProd", prodNo);
		return count == null ? 0 : count;
	}

	@Override
	public List<OrderVO> selectOrderTotalListCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderTotalList", null, rowBounds);
	}

	@Override
	public int selectOrderTotalCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderTotalCount");
	}

	@Override
	public List<OrderVO> selectOrderTotalList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderTotalList");
	}

	@Override
	public List<OrderVO> selectOrderDepList(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderDepList", null, rowBounds);
	}

	@Override
	public int selectOrderDepCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderDepCount");
	}

	@Override
	public void updateOrderDep(int orderNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateOrderDep", orderNo);
	}

	@Override
	public List<OrderVO> selectOrderShipList(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderShipList", null, rowBounds);
	}

	@Override
	public int selectOrderShipCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderShipCount");
	}

	@Override
	public void updateOrderShip(int orderNo, int orderState) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderNo", orderNo);
		params.put("orderState", orderState);
		
		sqlSession.update(NAMESPACE + ".updateOrderShip", params);
	}

	@Override
	public List<OrderVO> selectOrderCancelList(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderCancelList", null, rowBounds);
	}

	@Override
	public int selectOrderCancelCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderCancelCount");
	}
	
	@Override
	public void updateOrderCancel(int orderNo, int cancel) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		char cancelyn = (cancel == 1 ? 'y' : 'c');
		params.put("cancelyn", cancelyn);
		params.put("orderNo", orderNo);
		
		sqlSession.update(NAMESPACE + ".updateOrderCancel", params);
	}

	@Override
	public List<OrderVO> selectOrderListByComplete(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderListByComplete", cri, rowBounds);
	}

	@Override
	public int selectOrderListCountByComplete(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderListCountByComplete", cri);
	}

	@Override
	public void updateReviewyn(String orderSerial) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateReviewyn", orderSerial);
	}
	
	@Override
	public List<OrderVO> selectOrderListForTotSale(int year, int month) throws SQLException {
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		return sqlSession.selectList(NAMESPACE + ".selectOrderListForTotSale", date);
	}
	
	@Override
	public List<OrderVO> selectOrderSearchListForPay(int year, int month, SearchCriteria cri) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		params.put("date", date);
		params.put("cri", cri);
		return sqlSession.selectList(NAMESPACE + ".selectOrderSearchListForPay", params, rowBounds);
	}

	@Override
	public int selectOrderSearchListForPayCount(int year, int month, SearchCriteria cri) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		
		params.put("date", date);
		params.put("cri", cri);
		return sqlSession.selectOne(NAMESPACE + ".selectOrderSearchListForPayCount", params);
	}

	@Override
	public List<OrderVO> selectMyOrderList(String memId) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectMyOrderList", memId);
	}

	@Override
	public List<OrderVO> selectOrderTotalListForBalju(String adminId) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderTotalListForBalju", adminId);
	}
	
	@Override
	public List<OrderVO> selectOrderTotalListForBalju(Criteria cri, String adminId) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderTotalListForBalju", adminId, rowBounds);
	}

	@Override
	public int selectOrderTotalCountForBalju(String adminId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderTotalCountForBalju", adminId);
	}

	@Override
	public List<OrderVO> selectOrderDepListForBalju(Criteria cri, String adminId) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderDepListForBalju", adminId, rowBounds);
	}

	@Override
	public int selectOrderDepCountForBalju(String adminId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderDepCountForBalju", adminId);
	}

	@Override
	public List<OrderVO> selectOrderShipListForBalju(Criteria cri, String adminId) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectOrderShipListForBalju", adminId, rowBounds);
	}

	@Override
	public int selectOrderShipCountForBalju(String adminId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderShipCountForBalju", adminId);
	}

	@Override
	public void updateOrderSerial(OrderVO order) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateOrderSerial", order);
	}

	@Override
	public List<OrderVO> selectOrderListThisMonth() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderListThisMonth");
	}

	@Override
	public List<OrderVO> selectOrderListThisDay() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderListThisDay");
	}
	
}