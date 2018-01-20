package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.CommentDAO;
import com.dawn.angel.domain.CommentVO;

public class CommentDAOImpl implements CommentDAO{

	private static final String NAMESPACE = "Comment-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CommentVO> selectCommentListByProd(int prodNo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCommentListByProd", prodNo);
	}

}
