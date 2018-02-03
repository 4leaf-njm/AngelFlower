package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;

public interface MemberService {
	
	void createMember(MemberVO member) throws SQLException;
	void modifyMember(MemberVO member) throws SQLException;
	void removeMember(String id) throws SQLException;
	
	MemberVO getMemberById(String id) throws SQLException;
	
	List<MemberVO> getMemberList() throws SQLException;
	List<MemberVO> getMemberListByCri(Criteria cri) throws SQLException;
}
