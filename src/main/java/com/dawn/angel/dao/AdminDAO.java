package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.SearchCriteria;

public interface AdminDAO {
	
	void insertAdmin(AdminVO admin) throws SQLException;
	void updateAdmin(AdminVO admin) throws SQLException;
	void deleteAdmin(String id) throws SQLException;
	
	AdminVO selectAdminById(String id) throws SQLException;
	
	List<AdminVO> selectAdminList() throws SQLException;
	List<AdminVO> selectAdminListByCri(Criteria cri) throws SQLException;
	List<AdminVO> selectAdminListBySearch(SearchCriteria cri) throws SQLException;
	List<AdminVO> selectAdminListForPermit(Criteria cri) throws SQLException;
	
	int selectAdminListCountForPermit() throws SQLException;
	
	void updateAdminPermitYes(String id) throws SQLException;
	void updateAdminPermitNo(String id) throws SQLException;
	
	List<AdminVO> selectAdminListSearch(SearchCriteria cri, String adminId) throws SQLException;
	
	int selectAdminListSearchCount(SearchCriteria cri, String adminId) throws SQLException;
}
