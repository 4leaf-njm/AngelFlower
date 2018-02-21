package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;

public interface NoticeService {

	List<NoticeVO> getNoticeList() throws SQLException;
	
	List<NoticeVO> getNoticeListCri(Criteria cri) throws SQLException;
	
	NoticeVO getNoticeByNo(int noticeNo) throws SQLException;
	
	void insertNotice(NoticeVO notice) throws SQLException;
	
	void modifyNotice(NoticeVO notice) throws SQLException;
	
	void removeNotice(int noticeNo) throws SQLException;
	
	int getNoticeListCount() throws SQLException;
	
}
