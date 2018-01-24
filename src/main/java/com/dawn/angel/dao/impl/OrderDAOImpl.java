package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.domain.OrderVO;

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
		String orderState = "";
		
		if(order.getOrderWay().equals("무통장입금")) {
			orderState = "주문완료";
		} else {
			orderState = "결제완료";
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
	public OrderVO selectOrderByNoForGuest(int orderNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectOrderByNoForGuest", orderNo);
	}

	@Override
	public List<OrderVO> selectOrderDetailListForGuest(int orderNo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrderDetailListForGuest", orderNo);
	}

}
