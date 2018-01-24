package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.MemberDAO;
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
	}

	@Override
	public void deleteMember(String id) throws SQLException {
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

}
