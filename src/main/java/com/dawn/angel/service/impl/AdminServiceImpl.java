package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.AdminDAO;
import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.SearchCriteria;
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
		adminDAO.deleteAdmin(id);
	}

	@Override
	public AdminVO getAdminById(String id) throws SQLException {
		return adminDAO.selectAdminById(id);
	}

	@Override
	public List<AdminVO> getAdminList() throws SQLException {
		return adminDAO.selectAdminList();
	}

	@Override
	public List<AdminVO> getAdminListByCri(Criteria cri) throws SQLException {
		return adminDAO.selectAdminListByCri(cri);
	}

	@Override
	public List<AdminVO> getAdminListBySearch(SearchCriteria cri) throws SQLException {
		return adminDAO.selectAdminListBySearch(cri);
	}

	@Override
	public List<AdminVO> getAdminListForPermit(Criteria cri) throws SQLException {
		return adminDAO.selectAdminListForPermit(cri);
	}

	@Override
	public int getAdminListCountForPermit() throws SQLException {
		return adminDAO.selectAdminListCountForPermit();
	}

	@Override
	public void modifyAdminPermitYes(String id) throws SQLException {
		adminDAO.updateAdminPermitYes(id);
	}

	@Override
	public void modifyAdminPermitNo(String id) throws SQLException {
		adminDAO.updateAdminPermitNo(id);
	}

	@Override
	public List<AdminVO> getAdminListSearch(SearchCriteria cri, String adminId) throws SQLException {
		return adminDAO.selectAdminListSearch(cri, adminId);
	}

	@Override
	public int getAdminListSearchCount(SearchCriteria cri, String adminId) throws SQLException {
		return adminDAO.selectAdminListSearchCount(cri, adminId);
	}

}
