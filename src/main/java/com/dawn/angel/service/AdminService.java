package com.dawn.angel.service;

import java.sql.SQLException;

import com.dawn.angel.domain.AdminVO;

public interface AdminService {
	
	void createAdmin(AdminVO admin) throws SQLException;
	void modifyAdmin(AdminVO admin) throws SQLException;
	void removeAdmin(String id) throws SQLException;
	
	AdminVO getAdminById(String id) throws SQLException;
}
