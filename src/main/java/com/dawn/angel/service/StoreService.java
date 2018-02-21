package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.AccountVO;
import com.dawn.angel.domain.BannerVO;

public interface StoreService {

	public List<BannerVO> getBannerList() throws SQLException;
	
	public BannerVO getBannerByNo(int bannerNo) throws SQLException;
	
	public void modifyBanner(BannerVO banner) throws SQLException;
	
	public List<AccountVO> getAccountList() throws SQLException;
	
	public AccountVO getAccountByNo(int accNo) throws SQLException;
	
	public void insertAccount(AccountVO account) throws SQLException;
	
	public void modifyAccount(AccountVO account) throws SQLException;
	
	public void removeAccount(int accNo) throws SQLException;
	
}
