package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;

public interface MemberDAO {
	
	void insertMember(MemberVO member) throws SQLException;
	void updateMember(MemberVO member) throws SQLException;
	void deleteMember(String id) throws SQLException; 
	
	MemberVO selectMemberById(String id) throws SQLException;
	
	void updateSave(String id, int save) throws SQLException;
	
	List<MemberVO> selectMemberList() throws SQLException;
	List<MemberVO> selectMemberListByCri(Criteria cri) throws SQLException;
}

