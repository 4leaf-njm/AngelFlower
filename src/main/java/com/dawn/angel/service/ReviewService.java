package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.CommentVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;

public interface ReviewService {
	
	List<CommentVO> getCommentListByProd(int prodNo) throws SQLException;
	
	List<ReviewVO> getReviewListByCate(Criteria cri, int category, int type) throws SQLException;
	
	int getReviewListCount(int category, int type) throws SQLException;
}
