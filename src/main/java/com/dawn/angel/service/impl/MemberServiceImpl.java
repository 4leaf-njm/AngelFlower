package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dawn.angel.dao.MemberDAO;
import com.dawn.angel.domain.Criteria;
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
		memberDAO.updateMember(member);
	}

	@Override
	public void removeMember(String id) throws SQLException {
		memberDAO.deleteMember(id);
	}

	@Override
	public MemberVO getMemberById(String id) throws SQLException {
		return memberDAO.selectMemberById(id);
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return memberDAO.selectMemberList();
	}

	@Override
	public List<MemberVO> getMemberListByCri(Criteria cri) throws SQLException {
		return memberDAO.selectMemberListByCri(cri);
	}

	@Override
	public MemberVO getMemberFindId(Map<String, Object> params) throws SQLException {
		return memberDAO.selectMemberFindId(params);
	}

	@Override
	public MemberVO getMemberFindPw(Map<String, Object> params) throws SQLException {
		return memberDAO.selectMemberFindPw(params);
	}

	@Override
	public void modifyMemberPw(Map<String, Object> params) throws SQLException {
		memberDAO.updateMemberPw(params);
	}

	@Override
	public int getMemberByEmail(String email) throws SQLException {
		MemberVO member = memberDAO.selectMemberByEmail(email);
		if(member == null)
			return 1;
		else
			return 0;
	}

	@Override
	public int getMemberCountThisDay() throws SQLException {
		return memberDAO.selectMemberCountThisDay();
	}

	@Override
	public int getMemberCountThisMonth() throws SQLException {
		return memberDAO.selectMemberCountThisMonth();
	}
	
}
