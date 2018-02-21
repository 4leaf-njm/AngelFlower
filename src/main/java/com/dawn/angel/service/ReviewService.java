package com.dawn.angel.service;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;

public interface ReviewService {
	
	List<ReviewVO> getPrdListByNo(int prodNo) throws SQLException;
	
	List<ReviewVO> getReviewListByCate(Criteria cri, int category, int type) throws SQLException;
	
	int getReviewListCount(int category, int type) throws SQLException;
	
	void insertReview(ReviewVO review, String orderSerial) throws SQLException;
	
	List<ReviewVO> getReviewTotalList(Criteria cri) throws SQLException;
	
	int getReviewTotalListCount() throws SQLException;
	
	ReviewVO getReviewByNo(int reviewNo) throws SQLException;
	
	void modifyReview(ReviewVO review) throws SQLException;
	
	void removeReview(int reviewNo) throws SQLException;
	
	List<ReviewVO> getPrdTotalList(Criteria cri) throws SQLException;
	
	int getPrdTotalListCount() throws SQLException;
	
	void modifyPrdReply(ReviewVO review) throws SQLException;
	
	int getPrdNoListCount() throws SQLException;
	
	void insertPrdReview(ReviewVO review) throws SQLException;
}
