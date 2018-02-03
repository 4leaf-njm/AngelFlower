package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class AddressDAO {
	
	private static final String NAMESPACE = "Address-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<String> selectSido() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectSido");
	}
	
	public List<String> selectGugun(String sido) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectGugun", sido);
	}
}
