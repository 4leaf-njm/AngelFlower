package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;

public interface ReviewDAO {

	List<ReviewVO> selectReviewListByCate(Criteria cri, int category, int type) throws SQLException;
	
	int selectReviewListCount(int category, int type) throws SQLException;
	
	void insertReview(ReviewVO review) throws SQLException;
	
	List<ReviewVO> selectReviewTotalList(Criteria cri) throws SQLException;
	
	int selectReviewTotalListCount() throws SQLException;
	
	ReviewVO selectReviewByNo(int reviewNo) throws SQLException;
	
	void updateReview(ReviewVO review) throws SQLException;
	
	void deleteReview(int reviewNo) throws SQLException;
	
	List<ReviewVO> selectPrdTotalList(Criteria cri) throws SQLException;
	
	int selectPrdTotalListCount() throws SQLException;
	
	void updatePrdReply(ReviewVO review) throws SQLException;
	
	int selectPrdNoListCount() throws SQLException;
	
	List<ReviewVO> selectPrdListByNo(int prodNo) throws SQLException;
	
	void insertPrdReview(ReviewVO review) throws SQLException;
}
