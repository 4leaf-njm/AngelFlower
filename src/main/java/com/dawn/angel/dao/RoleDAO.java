package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.RoleVO;

public interface RoleDAO {
	
	public void insertRole(RoleVO role) throws SQLException;
	
	public void insertAuth(RoleVO role) throws SQLException;
	
	public int selectRoleMaxNo() throws SQLException;
	
	public List<RoleVO> selectRoleList() throws SQLException;
	
	public List<RoleVO> selectRoleListCri(Criteria cri) throws SQLException;
	
	public int selectRoleListCount() throws SQLException;
	
	public void deleteRole(int roleNo) throws SQLException;
	
	public void deleteAuth(int roleNo) throws SQLException;
	
	public List<RoleVO> selectAuthListByRole(int roleNo) throws SQLException;
	
	public void updateRole(RoleVO role) throws SQLException;
	
	public RoleVO selectRoleByNo(int roleNo) throws SQLException;
}
