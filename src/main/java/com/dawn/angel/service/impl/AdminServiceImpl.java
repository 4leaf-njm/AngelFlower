package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
		adminDAO.updateAdmin(admin);
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

	@Override
	public AdminVO getAdminFindId(Map<String, Object> params) throws SQLException {
		return adminDAO.selectAdminFindId(params);
	}

	@Override
	public AdminVO getAdminFindPw(Map<String, Object> params) throws SQLException {
		return adminDAO.selectAdminFindPw(params);
	}

	@Override
	public void modifyAdminPw(Map<String, Object> params) throws SQLException {
		adminDAO.updateAdminPw(params);
	}

	@Override
	public int getAdminByEmail(String email) throws SQLException {
		AdminVO admin = adminDAO.selectAdminByEmail(email);
		if(admin == null) 
			return 1;
		else
			return 0;
	}

	@Override
	public void modifyAdminRole(String adminId, int roleNo) throws SQLException {
		adminDAO.updateAdminRole(adminId, roleNo);
	}

	@Override
	public int getAdminCountThisDay() throws SQLException {
		return adminDAO.selectAdminCountThisDay();
	}

	@Override
	public int getAdminCountThisMonth() throws SQLException {
		return adminDAO.selectAdminCountThisMonth();
	}
}
