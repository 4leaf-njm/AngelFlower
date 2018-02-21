package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.AccountVO;

public interface AccountDAO {

	List<AccountVO> selectAccountList() throws SQLException;
	
	AccountVO selectAccountByNo(int accNo) throws SQLException;
	
	void insertAccount(AccountVO account) throws SQLException;
	
	void updateAccount(AccountVO account) throws SQLException;
	
	void deleteAccount(int accNo) throws SQLException;
}
