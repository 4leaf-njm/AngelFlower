package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.AccountDAO;
import com.dawn.angel.dao.BannerDAO;
import com.dawn.angel.domain.AccountVO;
import com.dawn.angel.domain.BannerVO;
import com.dawn.angel.service.StoreService;

public class StoreServiceImpl implements StoreService {

	private BannerDAO bannerDAO;
	
	private AccountDAO accountDAO;
	
	public void setBannerDAO(BannerDAO bannerDAO) {
		this.bannerDAO = bannerDAO;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public List<BannerVO> getBannerList() throws SQLException {
		return bannerDAO.selectBannerList();
	}

	@Override
	public BannerVO getBannerByNo(int bannerNo) throws SQLException {
		return bannerDAO.selectBannerByNo(bannerNo);
	}

	@Override
	public void modifyBanner(BannerVO banner) throws SQLException {
		bannerDAO.updateBanner(banner);
	}

	@Override
	public List<AccountVO> getAccountList() throws SQLException {
		return accountDAO.selectAccountList();
	}

	@Override
	public AccountVO getAccountByNo(int accNo) throws SQLException {
		return accountDAO.selectAccountByNo(accNo);
	}

	@Override
	public void insertAccount(AccountVO account) throws SQLException {
		accountDAO.insertAccount(account);
	}

	@Override
	public void modifyAccount(AccountVO account) throws SQLException {
		accountDAO.updateAccount(account);
	}

	@Override
	public void removeAccount(int accNo) throws SQLException {
		accountDAO.deleteAccount(accNo);
	}

}
