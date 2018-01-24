package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.CommentDAO;
import com.dawn.angel.dao.ReviewDAO;
import com.dawn.angel.domain.CommentVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.ReviewService;

public class ReviewServiceImpl implements ReviewService{
	
	private CommentDAO commentDAO;
	
	private ReviewDAO reviewDAO;
	
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	@Override
	public List<CommentVO> getCommentListByProd(int prodNo) throws SQLException {
		return commentDAO.selectCommentListByProd(prodNo);
	}

	@Override
	public List<ReviewVO> getReviewListByCate(Criteria cri, int category, int type) throws SQLException {
		return reviewDAO.selectReviewListByCate(cri, category, type);
	}

	@Override
	public int getReviewListCount(int category, int type) throws SQLException {
		return reviewDAO.selectReviewListCount(category, type);
	}
	
}
