package com.dawn.angel.service.impl;

import java.sql.SQLException;

import com.dawn.angel.dao.AdminDAO;
import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.service.AdminService;

public class AdminServiceImpl implements AdminService{

	private AdminDAO adminDAO;
	
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public void createAdmin(AdminVO admin) throws SQLException {
		adminDAO.insertAdmin(admin);
	}

	@Override
	public void modifyAdmin(AdminVO admin) throws SQLException {
	}

	@Override
	public void removeAdmin(String id) throws SQLException {
	}

	@Override
	public AdminVO getAdminById(String id) throws SQLException {
		return adminDAO.selectAdminById(id);
	}

}
