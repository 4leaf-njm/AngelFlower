package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.CartDAO;
import com.dawn.angel.dao.MemberDAO;
import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.service.OrderService;

public class OrderServiceImpl implements OrderService {
	
	private OrderDAO orderDAO;
	
	private CartDAO cartDAO;
	
	private MemberDAO memberDAO;
	
	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
	
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void insertOrder(OrderVO order) throws SQLException {
		orderDAO.insertOrder(order);
		int orderNo = orderDAO.selectMaxOrderNo();
		List<CartVO> cartList = cartDAO.selectCartListById(order.getMemId());
		int totalSave = 0;
		for(CartVO cart : cartList) {
			OrderVO o = new OrderVO();
			o.setProdNo(cart.getProdNo());
			o.setQuantity(cart.getQuantity());
			o.setOrderNo(orderNo);
			orderDAO.insertOrderDetail(o);
			totalSave += cart.getProdSave() * cart.getQuantity();
		}
		cartDAO.deleteCartAll(order.getMemId());
		MemberVO member = memberDAO.selectMemberById(order.getMemId());
		int save = member.getSave();
		int memSave = save - order.getUseSave() + totalSave;
		memberDAO.updateSave(order.getMemId(), memSave);
	}

	@Override
	public void insertOrderForGuest(OrderVO order, List<CartVO> cartList) throws SQLException {
		orderDAO.insertOrder(order);
		
		int orderNo = orderDAO.selectMaxOrderNo();
		for(CartVO cart : cartList) {
			OrderVO o = new OrderVO();
			o.setProdNo(cart.getProdNo());
			o.setQuantity(cart.getQuantity());
			o.setOrderNo(orderNo);
			orderDAO.insertOrderDetail(o);
		}
	}

	@Override
	public OrderVO getOrderByNo(int orderNo) throws SQLException {
		return orderDAO.selectOrderByNo(orderNo);
	}

	@Override
	public List<OrderVO> getOrderDetailList(int orderNo) throws SQLException {
		return orderDAO.selectOrderDetailList(orderNo);
	}

	@Override
	public int getMaxOrderNo() throws SQLException {
		return orderDAO.selectMaxOrderNo();
	}

	@Override
	public OrderVO getOrderByNoForGuest(int orderNo) throws SQLException {
		return orderDAO.selectOrderByNoForGuest(orderNo);
	}

	@Override
	public List<OrderVO> getOrderDetailListForGuest(int orderNo) throws SQLException {
		return orderDAO.selectOrderDetailListForGuest(orderNo);
	}

}
