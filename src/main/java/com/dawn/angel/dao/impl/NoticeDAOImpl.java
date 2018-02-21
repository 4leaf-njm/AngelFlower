package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.NoticeDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	private static final String NAMESPACE = "Notice-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectNoticeList");
	}

	@Override
	public List<NoticeVO> selectNoticeListCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE + ".selectNoticeList", null, rowBounds);
	}
	
	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectNoticeByNo", noticeNo);
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertNotice", notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateNotice", notice);
	}

	@Override
	public void deleteNotice(int noticeNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteNotice", noticeNo);
	}

	@Override
	public int selectNoticeListCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectNoticeListCount");
	}

}
