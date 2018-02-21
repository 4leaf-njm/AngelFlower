package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;

public interface MemberService {
	
	void createMember(MemberVO member) throws SQLException;
	void modifyMember(MemberVO member) throws SQLException;
	void removeMember(String id) throws SQLException;
	
	MemberVO getMemberById(String id) throws SQLException;
	
	List<MemberVO> getMemberList() throws SQLException;
	List<MemberVO> getMemberListByCri(Criteria cri) throws SQLException;
	
	MemberVO getMemberFindId(Map<String, Object> params) throws SQLException;
	
	MemberVO getMemberFindPw(Map<String, Object> params) throws SQLException;
	
	void modifyMemberPw(Map<String, Object> params) throws SQLException;
	
	int getMemberByEmail(String email) throws SQLException;
	
	int getMemberCountThisDay() throws SQLException;
	
	int getMemberCountThisMonth() throws SQLException;
}
