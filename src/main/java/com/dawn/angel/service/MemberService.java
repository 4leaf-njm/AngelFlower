package com.dawn.angel.service;

import java.sql.SQLException;

import com.dawn.angel.domain.MemberVO;

public interface MemberService {
	
	void createMember(MemberVO member) throws SQLException;
	void modifyMember(MemberVO member) throws SQLException;
	void removeMember(String id) throws SQLException;
	
	MemberVO getMemberById(String id) throws SQLException;
}
