package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> selectNoticeList() throws SQLException;
	
	List<NoticeVO> selectNoticeListCri(Criteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNo(int noticeNo) throws SQLException;
	
	void insertNotice(NoticeVO notice) throws SQLException;
	
	void updateNotice(NoticeVO notice) throws SQLException;
	
	void deleteNotice(int noticeNo) throws SQLException;
	
	int selectNoticeListCount() throws SQLException;
}
