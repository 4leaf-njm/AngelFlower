package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.RoleVO;

public interface RoleService {
	
	public void insertRole(RoleVO role, String[] authList) throws SQLException;
	
	public List<RoleVO> getRoleList() throws SQLException;
	
	public List<RoleVO> getRoleListCri(Criteria cri) throws SQLException;
	
	public int getRoleListCount() throws SQLException;
	
	public void removeRole(int roleNo) throws SQLException;
	
	public List<RoleVO> getAuthListByRole(int roleNo) throws SQLException;
	
	public void modifyRole(RoleVO role, String[] authList) throws SQLException;
	
	RoleVO getRoleByNo(int roleNo) throws SQLException;
}
