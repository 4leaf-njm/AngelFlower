package com.dawn.angel.dao;

import java.sql.SQLException;

import com.dawn.angel.domain.AdminVO;

public interface AdminDAO {
	
	void insertAdmin(AdminVO admin) throws SQLException;
	void updateAdmin(AdminVO admin) throws SQLException;
	void deleteAdmin(String id) throws SQLException;
	
	AdminVO selectAdminById(String id) throws SQLException;
}
