package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.MemberDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;

public class MemberDAOImpl implements MemberDAO{
	
	private static final String NAMESPACE = "Member-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertMember(MemberVO member) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertMember", member);
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateMember", member);
	}

	@Override
	public void deleteMember(String id) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteMember", id);
	}

	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberById", id);
	}

	@Override
	public void updateSave(String id, int save) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("memId", id);
		params.put("memSave", save);
		
		sqlSession.update(NAMESPACE + ".updateSave", params);
	}

	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectMemberList");
	}

	@Override
	public List<MemberVO> selectMemberListByCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectMemberList", null, rowBounds);
	}

	@Override
	public MemberVO selectMemberFindId(Map<String, Object> params) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberFindId", params);
	}

	@Override
	public MemberVO selectMemberFindPw(Map<String, Object> params) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberFindPw", params);
	}

	@Override
	public void updateMemberPw(Map<String, Object> params) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateMemberPw", params);
	}

	@Override
	public MemberVO selectMemberByEmail(String email) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberByEmail", email);
	}

	@Override
	public int selectMemberCountThisDay() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberCountThisDay");
	}

	@Override
	public int selectMemberCountThisMonth() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectMemberCountThisMonth");
	}

}
