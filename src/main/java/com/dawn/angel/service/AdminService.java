package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.SearchCriteria;

public interface AdminService {
	
	void createAdmin(AdminVO admin) throws SQLException;
	void modifyAdmin(AdminVO admin) throws SQLException;
	void removeAdmin(String id) throws SQLException;
	
	AdminVO getAdminById(String id) throws SQLException;
	
	List<AdminVO> getAdminList() throws SQLException;
	List<AdminVO> getAdminListByCri(Criteria cri) throws SQLException;
	List<AdminVO> getAdminListBySearch(SearchCriteria cri) throws SQLException;
	List<AdminVO> getAdminListForPermit(Criteria cri) throws SQLException;
	
	int getAdminListCountForPermit() throws SQLException;
	
	void modifyAdminPermitYes(String id) throws SQLException;
	void modifyAdminPermitNo(String id) throws SQLException;
	
	List<AdminVO> getAdminListSearch(SearchCriteria cri, String adminId) throws SQLException;
	
	int getAdminListSearchCount(SearchCriteria cri, String adminId) throws SQLException;
}
