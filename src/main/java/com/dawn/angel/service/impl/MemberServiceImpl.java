package com.dawn.angel.service.impl;

import java.sql.SQLException;

import com.dawn.angel.dao.MemberDAO;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.service.MemberService;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public void createMember(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);
	}

	@Override
	public void modifyMember(MemberVO member) throws SQLException {
	}

	@Override
	public void removeMember(String id) throws SQLException {
	}

	@Override
	public MemberVO getMemberById(String id) throws SQLException {
		return memberDAO.selectMemberById(id);
	}

}
