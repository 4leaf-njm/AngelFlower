package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dawn.angel.dao.CartDAO;
import com.dawn.angel.dao.MemberDAO;
import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PayVO;
import com.dawn.angel.domain.SearchCriteria;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.util.SerialUtil;

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
		int orderNo = orderDAO.selectMaxOrderNo();
		String serial = SerialUtil.getSerialNumber(orderNo + 1);
		order.setOrderSerial(serial);
		order.setType(1);
		orderDAO.insertOrder(order);
		
		List<CartVO> cartList = cartDAO.selectCartListById(order.getMemId());
		int totalSave = 0;
		for(CartVO cart : cartList) {
			OrderVO o = new OrderVO();
			o.setProdNo(cart.getProdNo());
			o.setQuantity(cart.getQuantity());
			o.setOrderNo(orderNo+1);
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
		int orderNo = orderDAO.selectMaxOrderNo();
		String serial = SerialUtil.getSerialNumber(orderNo + 1);
		order.setOrderSerial(serial);
		orderDAO.insertOrder(order);
		
		for(CartVO cart : cartList) {
			OrderVO o = new OrderVO();
			o.setProdNo(cart.getProdNo());
			o.setQuantity(cart.getQuantity());
			o.setOrderNo(orderNo+1);
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

	@Override
	public int getOrderCountById(String memId) throws SQLException {
		return orderDAO.selectOrderCountById(memId);
	}

	@Override
	public int getOrderCountByProd(int prodNo) throws SQLException {
		return orderDAO.selectOrderCountByProd(prodNo);
	}

	@Override
	public List<OrderVO> getOrderTotalListCri(Criteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderTotalListCri(cri);
		for(OrderVO order : orderList) {
			List<OrderVO> odList = orderDAO.selectOrderDetailList(order.getOrderNo());
			int totalPrice = 0;
			for(OrderVO o : odList) {
				if(order.getMemId() == null) 
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else 
					totalPrice += o.getProdPrice2() * o.getQuantity();
			}
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setTotalPrice(totalPrice);
			order.setRealPrice(totalPrice - order.getUseSave());
		}
		
		return orderList;
	}

	@Override
	public int getOrderTotalCount() throws SQLException {
		return orderDAO.selectOrderTotalCount();
	}

	@Override
	public List<OrderVO> getOrderTotalList() throws SQLException {
		return orderDAO.selectOrderTotalList();
	}

	@Override
	public List<OrderVO> getOrderDepList(Criteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderDepList(cri);
		for(OrderVO order : orderList) {
			List<OrderVO> odList = orderDAO.selectOrderDetailList(order.getOrderNo());
			int totalPrice = 0;
			for(OrderVO o : odList) {
				if(order.getMemId() == null) 
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else 
					totalPrice += o.getProdPrice2() * o.getQuantity();
			}
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setTotalPrice(totalPrice);
			order.setRealPrice(totalPrice - order.getUseSave());
		}
		return orderList;
	}

	@Override
	public int getOrderDepCount() throws SQLException {
		return orderDAO.selectOrderDepCount();
	}

	@Override
	public void modifyOrderDep(int orderNo) throws SQLException {
		orderDAO.updateOrderDep(orderNo);
	}

	@Override
	public List<OrderVO> getOrderShipList(Criteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderShipList(cri);
		for(OrderVO order : orderList) {
			List<OrderVO> odList = orderDAO.selectOrderDetailList(order.getOrderNo());
			int totalPrice = 0;
			for(OrderVO o : odList) {
				if(order.getMemId() == null) 
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else 
					totalPrice += o.getProdPrice2() * o.getQuantity();
			}
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setTotalPrice(totalPrice);
			order.setRealPrice(totalPrice - order.getUseSave());
		}
		return orderList;
	}

	@Override
	public int getOrderShipCount() throws SQLException {
		return orderDAO.selectOrderShipCount();
	}

	@Override
	public void modifyOrderShip(int orderNo, int orderState) throws SQLException {
		orderDAO.updateOrderShip(orderNo, orderState);
	}

	@Override
	public List<OrderVO> getOrderCancelList(Criteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderCancelList(cri);
		for(OrderVO order : orderList) {
			List<OrderVO> odList = orderDAO.selectOrderDetailList(order.getOrderNo());
			int totalPrice = 0;
			for(OrderVO o : odList) {
				if(order.getMemId() == null) 
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else 
					totalPrice += o.getProdPrice2() * o.getQuantity();
			}
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setTotalPrice(totalPrice);
			order.setRealPrice(totalPrice - order.getUseSave());
		}
		return orderList;
	}

	@Override
	public int getOrderCancelCount() throws SQLException {
		return orderDAO.selectOrderCancelCount();
	}
	
	@Override
	public void modifyOrderCancel(int orderNo, int cancel) throws SQLException {
		orderDAO.updateOrderCancel(orderNo, cancel);
	}

	@Override
	public List<OrderVO> getOrderListByComplete(SearchCriteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderListByComplete(cri);
		
		int totalPrice = 0; 
		for(OrderVO order : orderList) {
			List<OrderVO> oList = orderDAO.selectOrderDetailList(order.getOrderNo());
			if(oList.size() > 1) 
				order.setProdName(order.getProdName() + " 외 " + (oList.size()-1) + " 개");
			for(OrderVO o : oList) {
				if(o.getMemId() == null)
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else
					totalPrice += o.getProdPrice2() * o.getQuantity();
			} 
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setRealPrice(totalPrice);
			totalPrice = 0;
		}
		return orderList;
	}

	@Override
	public int getOrderListCountByComplete(SearchCriteria cri) throws SQLException {
		return orderDAO.selectOrderListCountByComplete(cri);
	}

	@Override
	public List<PayVO> getPayListForTotSale(int year) throws SQLException {
		List<PayVO> payList = new ArrayList<PayVO>();
		for(int i=1; i<=12; i++) {
			List<OrderVO> orderList = orderDAO.selectOrderListForTotSale(year, i);
			int orderMoney = 0;
			int compleCount = 0;
			int totalMoney = 0;
			for(OrderVO order : orderList) {
				if(order.getType() == 2) {
					orderMoney += order.getBaljuPrice();
					if(order.getOrderState() == 4 && order.getCancelyn() != 'y') {
						compleCount ++;
						totalMoney += order.getBaljuPrice();
					}
				} else {
					if(order.getOrderState() == 4 && order.getCancelyn() != 'y'){
						compleCount ++;
						totalMoney -= order.getUseSave();
					}
					List<OrderVO> odetailList = orderDAO.selectOrderDetailList(order.getOrderNo());
					for(OrderVO od : odetailList) {
						if(od.getOrderState() == 4 && od.getCancelyn() != 'y') {
							if(od.getMemId() == null) 
								totalMoney += od.getProdPrice1() * od.getQuantity();
							 else 
								totalMoney += od.getProdPrice2() * od.getQuantity();
						}
						if(od.getMemId() == null) {
							orderMoney += od.getProdPrice1() * od.getQuantity();
						}
						 else {
							orderMoney += od.getProdPrice2() * od.getQuantity();
						 }
					}
					orderMoney -= order.getUseSave();
				}
			}
			PayVO pay = new PayVO();
			pay.setOrderCount(orderList.size());
			pay.setOrderMoney(orderMoney);
			pay.setCompleCount(compleCount);
			pay.setTotalMoney(totalMoney);
			payList.add(pay);
		}
		return payList;
	}

	@Override
	public List<OrderVO> getOrderListForPay(int year, int month, SearchCriteria cri) throws SQLException {
		List<OrderVO> orderList = orderDAO.selectOrderSearchListForPay(year, month, cri);
		int totalPrice = 0; 
		for(OrderVO order : orderList) {
			List<OrderVO> oList = orderDAO.selectOrderDetailList(order.getOrderNo());
			if(oList.size() > 1) 
				order.setProdName(order.getProdName() + " 외 " + (oList.size()-1) + " 개");
			for(OrderVO o : oList) {
				if(o.getMemId() == null)
					totalPrice += o.getProdPrice1() * o.getQuantity();
				else
					totalPrice += o.getProdPrice2() * o.getQuantity();
			} 
			if(order.getType() == 2) totalPrice = order.getBaljuPrice();
			order.setRealPrice(totalPrice);
			totalPrice = 0;
		}
		return orderList;
	}

	@Override
	public int getOrderSearchListForPayCount(int year, int month, SearchCriteria cri) throws SQLException {
		return orderDAO.selectOrderSearchListForPayCount(year, month, cri);
	}

}
