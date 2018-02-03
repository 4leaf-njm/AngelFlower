package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;

public interface BaljuDAO {
	
	void insertBalju(BaljuVO balju) throws SQLException;
	
	void insertBaljuDetail(BaljuVO balju) throws SQLException;
	
	int selectBaljuMaxNo() throws SQLException;
	
	List<BaljuVO> selectBaljuRecList(Criteria cri, String adminId) throws SQLException;
	
	int selectBaljuRecListCount(String adminId) throws SQLException;
	
	List<BaljuVO> selectBaljuSendList(Criteria cri, String adminId) throws SQLException;
	
	int selectBaljuSendListCount(String adminId) throws SQLException;
	
	void updateBaljuCheck(int baljuNo) throws SQLException;
	
	BaljuVO selectBaljuByNo(int baljuNo) throws SQLException;
	
	List<BaljuVO> selectBaljuDetail(int baljuNo) throws SQLException;
	
	List<BaljuVO> selectBaljuTotalList() throws SQLException;
	
	List<BaljuVO> selectBaljuListForPay(String adminId, int year, int month) throws SQLException;
	
	List<BaljuVO> selectBaljuListCriForPay(Criteria cri, String adminId, int year, int month) throws SQLException;
	
	int selectBaljuListCriForPayCount(String adminId, int year, int month) throws SQLException;
}
