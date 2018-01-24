package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.ReviewVO;

public interface ReviewDAO {

	List<ReviewVO> selectReviewListByCate(Criteria cri, int category, int type) throws SQLException;
	
	int selectReviewListCount(int category, int type) throws SQLException;
}
