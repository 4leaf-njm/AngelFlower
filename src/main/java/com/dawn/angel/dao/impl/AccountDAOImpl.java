package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.AccountDAO;
import com.dawn.angel.domain.AccountVO;

public class AccountDAOImpl implements AccountDAO {

	private static final String NAMESPACE = "Account-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AccountVO> selectAccountList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectAccountList");
	}

	@Override
	public AccountVO selectAccountByNo(int accNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectAccountByNo", accNo);
	}

	@Override
	public void insertAccount(AccountVO account) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertAccount", account);
	}

	@Override
	public void updateAccount(AccountVO account) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateAccount", account);
	}

	@Override
	public void deleteAccount(int accNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteAccount", accNo);
	}

}
