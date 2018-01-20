package com.dawn.angel.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.AdminDAO;
import com.dawn.angel.domain.AdminVO;

public class AdminDAOImpl implements AdminDAO{
	
	private static final String NAMESPACE = "Admin-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertAdmin(AdminVO admin) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertAdmin", admin);
	}

	@Override
	public void updateAdmin(AdminVO admin) throws SQLException {
	}

	@Override
	public void deleteAdmin(String id) throws SQLException {
	}

	@Override
	public AdminVO selectAdminById(String id) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectAdminById", id);
	}

}
