package com.dawn.angel.dao;

import java.sql.SQLException;
import java.util.List;

import com.dawn.angel.domain.ReviewVO;

public interface ReviewDAO {

	List<ReviewVO> selectReviewListByCate(int category) throws SQLException;
}
