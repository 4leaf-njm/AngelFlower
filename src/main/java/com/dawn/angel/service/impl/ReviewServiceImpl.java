package com.dawn.angel.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.dao.CommentDAO;
import com.dawn.angel.dao.OrderDAO;
import com.dawn.angel.dao.ProductDAO;
import com.dawn.angel.dao.ReviewDAO;
import com.dawn.angel.domain.CommentVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.ReviewService;

public class ReviewServiceImpl implements ReviewService{
	
	private CommentDAO commentDAO;
	
	private ReviewDAO reviewDAO;
	
	private OrderDAO orderDAO;
	
	private ProductDAO productDAO;
	
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<CommentVO> getCommentListByProd(int prodNo) throws SQLException {
		return commentDAO.selectCommentListByProd(prodNo);
	}

	@Override
	public List<ReviewVO> getReviewListByCate(Criteria cri, int category, int type) throws SQLException {
		List<ReviewVO> reviewList = reviewDAO.selectReviewListByCate(cri, category, type);
		for(ReviewVO review : reviewList) {
			if(review.getType() == 2) {
				int prodNo = review.getProdNo();
				ProductVO product = productDAO.selectProductByNo(prodNo);
				review.setProdName(product.getName());
				review.setProdPrice1(product.getPrice1());
				review.setProdPrice2(product.getPrice2());
			}
		}
		return reviewList;
	}

	@Override
	public int getReviewListCount(int category, int type) throws SQLException {
		return reviewDAO.selectReviewListCount(category, type);
	}

	@Override
	public void insertReview(ReviewVO review, String orderSerial) throws SQLException {
		reviewDAO.insertReview(review);
		orderDAO.updateReviewyn(orderSerial);
	}

	@Override
	public List<ReviewVO> getReviewTotalList(Criteria cri) throws SQLException {
		return reviewDAO.selectReviewTotalList(cri);
	}

	@Override
	public int getReviewTotalListCount() throws SQLException {
		return reviewDAO.selectReviewTotalListCount();
	}

	@Override
	public ReviewVO getReviewByNo(int reviewNo) throws SQLException {
		return reviewDAO.selectReviewByNo(reviewNo);
	}

	@Override
	public void modifyReview(ReviewVO review) throws SQLException {
		reviewDAO.updateReview(review);
	}

	@Override
	public void removeReview(int reviewNo) throws SQLException {
		reviewDAO.deleteReview(reviewNo);
	}

	@Override
	public List<ReviewVO> getPrdTotalList(Criteria cri) throws SQLException {
		List<ReviewVO> reviewList = reviewDAO.selectPrdTotalList(cri);
		for(ReviewVO review : reviewList) {
			if(review.getProdNo() != 0) {
				ProductVO product = productDAO.selectProductByNo(review.getProdNo());
				review.setProdName(product.getName());
			}
		}
		return reviewList;
	}

	@Override
	public int getPrdTotalListCount() throws SQLException {
		return reviewDAO.selectPrdTotalListCount();
	}

	@Override
	public void modifyPrdReply(ReviewVO review) throws SQLException {
		reviewDAO.updatePrdReply(review);
	}

	@Override
	public int getPrdNoListCount() throws SQLException {
		return reviewDAO.selectPrdNoListCount();
	}
}
