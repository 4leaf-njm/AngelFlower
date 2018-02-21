package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.RoleDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.RoleVO;
import com.dawn.angel.service.RoleService;

public class RoleServiceImpl implements RoleService{

	private RoleDAO roleDAO;

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	@Override
	public void insertRole(RoleVO role, String[] authList) throws SQLException {
		roleDAO.insertRole(role);
		int roleNo = roleDAO.selectRoleMaxNo();
		for(String auth : authList) {
			RoleVO roleVO = new RoleVO();
			roleVO.setRoleNo(roleNo);
			roleVO.setAuthName(auth);
			roleDAO.insertAuth(roleVO);
		}
	}

	@Override
	public List<RoleVO> getRoleList() throws SQLException {
		return roleDAO.selectRoleList();
	}
	
	@Override
	public List<RoleVO> getRoleListCri(Criteria cri) throws SQLException {
		return roleDAO.selectRoleListCri(cri);
	}

	@Override
	public int getRoleListCount() throws SQLException {
		return roleDAO.selectRoleListCount();
	}

	@Override
	public void removeRole(int roleNo) throws SQLException {
		roleDAO.deleteAuth(roleNo);
		roleDAO.deleteRole(roleNo);
	}

	@Override
	public List<RoleVO> getAuthListByRole(int roleNo) throws SQLException {
		return roleDAO.selectAuthListByRole(roleNo);
	}

	@Override
	public void modifyRole(RoleVO role, String[] authList) throws SQLException {
		roleDAO.updateRole(role);
		roleDAO.deleteAuth(role.getRoleNo());
		for(String auth : authList) {
			RoleVO roleVO = new RoleVO();
			roleVO.setRoleNo(role.getRoleNo());
			roleVO.setAuthName(auth);
			roleDAO.insertAuth(roleVO);
		}
	}

	@Override
	public RoleVO getRoleByNo(int roleNo) throws SQLException {
		return roleDAO.selectRoleByNo(roleNo);
	}
}
