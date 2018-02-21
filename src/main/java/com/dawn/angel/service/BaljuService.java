package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PayVO;

public interface BaljuService {

	void insertBalju(BaljuVO balju, Map<String, Object> params) throws SQLException;
	
	List<BaljuVO> getBaljuRecList(Criteria cri, String adminId) throws SQLException;
	
	int getBaljuRecListCount(String adminId) throws SQLException;
	
	List<BaljuVO> getBaljuSendList(Criteria cri, String adminId) throws SQLException;
	
	int getBaljuSendListCount(String adminId) throws SQLException;
	
	void modifyBaljuCheck(int baljuNo) throws SQLException;
	
	List<BaljuVO> getBaljuTotalList() throws SQLException;
	
	List<BaljuVO> getBaljuTotalListForPay(Criteria cri) throws SQLException;
	
	int getBaljuTotalListCount() throws SQLException;
	
	List<PayVO> getBaljuListForPay(String adminId, int year) throws SQLException;
	
	List<BaljuVO> getBaljuListCriForPay(Criteria cri, String adminId, int year, int month) throws SQLException;
	
	int getBaljuListCriForPayCount(String adminId, int year, int month) throws SQLException;
	
	List<BaljuVO> getBaljuDetail(int baljuNo) throws SQLException;
	
	BaljuVO getBaljuByNo(int baljuNo) throws SQLException;
}
