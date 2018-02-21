package com.dawn.angel.domain;

public class RoleVO {
	private int roleNo; // 역할 번호
	private String roleName; // 역할명
	private int authNo; // 권한번호
	private String authName; // 권한명
	private char adminyn; // 최고관리자 여부 
	
	public int getRoleNo() {
		return roleNo;
	}
	public void setRoleNo(int roleNo) {
		this.roleNo = roleNo;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public int getAuthNo() {
		return authNo;
	}
	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public char getAdminyn() {
		return adminyn;
	}
	public void setAdminyn(char adminyn) {
		this.adminyn = adminyn;
	}
	@Override
	public String toString() {
		return "RoleVO [roleNo=" + roleNo + ", roleName=" + roleName + ", authNo=" + authNo + ", authName=" + authName
				+ ", adminyn=" + adminyn + "]";
	}
}
