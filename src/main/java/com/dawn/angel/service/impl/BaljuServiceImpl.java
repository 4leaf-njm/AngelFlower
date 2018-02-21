package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.dawn.angel.dao.BaljuDAO;
import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PayVO;
import com.dawn.angel.service.BaljuService;
import com.dawn.angel.util.SerialUtil;

public class BaljuServiceImpl implements BaljuService {

	private BaljuDAO baljuDAO;
	
	private OrderDAO orderDAO;
	
	public void setBaljuDAO(BaljuDAO baljuDAO) {
		this.baljuDAO = baljuDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	public void insertBalju(BaljuVO balju, Map<String, Object> params) throws SQLException {
		int baljuNo = baljuDAO.selectBaljuMaxNo();
		String baljuSerial = SerialUtil.getSerialNumber(baljuNo + 1);
		balju.setBaljuSerial(baljuSerial);
		baljuDAO.insertBalju(balju);
		int[] prodArr = (int[]) params.get("prodArr");
		int[] quentArr = (int[]) params.get("quentArr");
		for(int i=0; i<prodArr.length; i++) {
			balju.setBaljuNo(baljuNo + 1);
			balju.setProdNo(prodArr[i]);
			balju.setQuantity(quentArr[i]);
			baljuDAO.insertBaljuDetail(balju);
		}
	}

	@Override
	public List<BaljuVO> getBaljuRecList(Criteria cri, String adminId) throws SQLException {
		return baljuDAO.selectBaljuRecList(cri, adminId);
	}

	@Override
	public List<BaljuVO> getBaljuSendList(Criteria cri, String adminId) throws SQLException {
		return baljuDAO.selectBaljuSendList(cri, adminId);
	}

	@Override
	public int getBaljuRecListCount(String adminId) throws SQLException {
		return baljuDAO.selectBaljuRecListCount(adminId);
	}

	@Override
	public int getBaljuSendListCount(String adminId) throws SQLException {
		return baljuDAO.selectBaljuSendListCount(adminId);
	}

	@Override
	public void modifyBaljuCheck(int baljuNo) throws SQLException {
		List<BaljuVO> baljuList = baljuDAO.selectBaljuDetail(baljuNo);
		BaljuVO balju = baljuDAO.selectBaljuByNo(baljuNo);
		OrderVO order = new OrderVO();
		order.setMemName(balju.getBaljuMemName());
		order.setMemPhone(balju.getBaljuMemPhone());
		order.setBaljuPrice(balju.getBaljuPrice());
		order.setBaljuNo(baljuNo);
		order.setOrderWay("발주");
		order.setType(2);
		orderDAO.insertOrder(order);
		int orderMax = orderDAO.selectMaxOrderNo();
		String orderSerial = SerialUtil.getSerialNumber(orderMax);
		order.setOrderSerial(orderSerial);
		order.setOrderNo(orderMax);
		orderDAO.updateOrderSerial(order);
		for(BaljuVO bj : baljuList) {
			OrderVO o = new OrderVO();
			o.setOrderNo(orderMax);
			o.setProdNo(bj.getProdNo());
			o.setQuantity(bj.getQuantity());
			orderDAO.insertOrderDetail(o);
		}
		baljuDAO.updateBaljuCheck(baljuNo);
	}

	@Override
	public List<BaljuVO> getBaljuTotalList() throws SQLException { 
		return baljuDAO.selectBaljuTotalList();
	}

	@Override
	public List<BaljuVO> getBaljuTotalListForPay(Criteria cri) throws SQLException {
		return baljuDAO.selectBaljuTotalListForPay(cri);
	}

	@Override
	public int getBaljuTotalListCount() throws SQLException { 
		return baljuDAO.selectBaljuTotalListCount();
	}

	@Override
	public List<PayVO> getBaljuListForPay(String adminId, int year) throws SQLException {
		List<PayVO> payList = new ArrayList<PayVO>();
		for(int i=1; i<=12; i++) {
			List<BaljuVO> baljuList = baljuDAO.selectBaljuListForPay(adminId, year, i);
			int sendCount = 0;
			int totalSendMoney = 0;
			int sendMoney = 0;
			int recCount = 0;
			int totalRecMoney = 0;
			int totalBaljuMoney = 0;
			for(BaljuVO balju : baljuList) {
				if(balju.getBaljuSendId().equals(adminId)) {
					totalSendMoney += balju.getBaljuPrice();
					sendMoney += balju.getBaljuSendPrice();
					sendCount ++;
				} else if (balju.getBaljuRecId().equals(adminId)) {
					totalRecMoney += balju.getBaljuRecPrice();
					recCount ++;
				}
			}
			totalBaljuMoney = sendMoney + totalRecMoney;
			PayVO pay = new PayVO();
			pay.setSendCount(sendCount);
			pay.setTotalSendMoney(totalSendMoney);
			pay.setSendMoney(sendMoney);
			pay.setRecCount(recCount);
			pay.setTotalRecMoney(totalRecMoney);
			pay.setTotalBaljuMoney(totalBaljuMoney);
			payList.add(pay);
		}
		return payList;
	}

	@Override
	public List<BaljuVO> getBaljuListCriForPay(Criteria cri, String adminId, int year, int month) throws SQLException {
		return baljuDAO.selectBaljuListCriForPay(cri, adminId, year, month);
	}

	@Override
	public int getBaljuListCriForPayCount(String adminId, int year, int month) throws SQLException {
		return baljuDAO.selectBaljuListCriForPayCount(adminId, year, month);
	}

	@Override
	public List<BaljuVO> getBaljuDetail(int baljuNo) throws SQLException {
		return baljuDAO.selectBaljuDetail(baljuNo);
	}

	@Override
	public BaljuVO getBaljuByNo(int baljuNo) throws SQLException {
		return baljuDAO.selectBaljuByNo(baljuNo);
	}

}
