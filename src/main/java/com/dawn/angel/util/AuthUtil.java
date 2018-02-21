package com.dawn.angel.util;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.RoleVO;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.RoleService;

public class AuthUtil {
	
	private AdminService adminService;
	
	private RoleService roleService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public boolean hasRole(String adminId, String role) throws SQLException {
		AdminVO admin = adminService.getAdminById(adminId);
		List<RoleVO> roleList = roleService.getAuthListByRole(admin.getRoleNo());
		if(roleList == null) return false;
		else {
			for(RoleVO roleVO : roleList) {
				if(roleVO.getAuthName().equals(role)) return true;
			}
			return false;
		}
	}
	
	public boolean isAdmin(String adminId) throws SQLException {
		AdminVO admin = adminService.getAdminById(adminId);
		RoleVO role = roleService.getRoleByNo(admin.getRoleNo());
		return role.getAdminyn() == 'y' ? true : false;
	}
}
