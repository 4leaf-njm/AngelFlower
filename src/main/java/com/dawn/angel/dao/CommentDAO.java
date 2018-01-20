package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.CommentVO;

public interface CommentDAO {
	
	List<CommentVO> selectCommentListByProd(int prodNo) throws SQLException;
}
