package com.dawn.angel.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.VisitDAO;

public class VisitDAOImpl implements VisitDAO {

	private static final String NAMESPACE = "Visit-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectVisitTodayCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectVisitTodayCount");
	}

	@Override
	public int selectVisitMonthCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectVisitMonthCount");
	}

	@Override
	public void insertVisit() throws SQLException {
		sqlSession.selectOne(NAMESPACE + ".insertVisit");
	}

}
