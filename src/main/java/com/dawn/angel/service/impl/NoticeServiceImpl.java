package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.NoticeDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;
import com.dawn.angel.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<NoticeVO> getNoticeList() throws SQLException {
		return noticeDAO.selectNoticeList();
	}

	@Override
	public List<NoticeVO> getNoticeListCri(Criteria cri) throws SQLException {
		return noticeDAO.selectNoticeListCri(cri);
	}
	
	@Override
	public NoticeVO getNoticeByNo(int noticeNo) throws SQLException {
		return noticeDAO.selectNoticeByNo(noticeNo);
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		noticeDAO.insertNotice(notice);
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
	}

	@Override
	public void removeNotice(int noticeNo) throws SQLException {
		noticeDAO.deleteNotice(noticeNo);
	}

	@Override
	public int getNoticeListCount() throws SQLException {
		return noticeDAO.selectNoticeListCount();
	}
	
}
