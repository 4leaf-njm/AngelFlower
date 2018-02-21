package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.BaljuDAO;
import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;

public class BaljuDAOImpl implements BaljuDAO {

	private static final String NAMESPACE = "Balju-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertBalju(BaljuVO balju) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertBalju", balju);
	}

	@Override
	public void insertBaljuDetail(BaljuVO balju) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertBaljuDetail", balju);
	}

	@Override
	public int selectBaljuMaxNo() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuMaxNo");
	}

	@Override
	public List<BaljuVO> selectBaljuRecList(Criteria cri, String adminId) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectBaljuRecList", adminId, rowBounds);
	}

	@Override
	public List<BaljuVO> selectBaljuSendList(Criteria cri, String adminId) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectBaljuSendList", adminId, rowBounds);
	}

	@Override
	public int selectBaljuRecListCount(String adminId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuRecListCount", adminId);
	}

	@Override
	public int selectBaljuSendListCount(String adminId) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuSendListCount", adminId);
	}

	@Override
	public void updateBaljuCheck(int baljuNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateBaljuCheck", baljuNo);
	}

	@Override
	public BaljuVO selectBaljuByNo(int baljuNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuByNo", baljuNo);
	}

	@Override
	public List<BaljuVO> selectBaljuDetail(int baljuNo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectBaljuDetail", baljuNo);
	}

	@Override
	public List<BaljuVO> selectBaljuTotalList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectBaljuTotalList");
	}

	@Override
	public List<BaljuVO> selectBaljuTotalListForPay(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE + ".selectBaljuTotalListForPay", null, rowBounds);
	}
	
	@Override
	public int selectBaljuTotalListCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuTotalListCount");
	}
	
	@Override
	public List<BaljuVO> selectBaljuListForPay(String adminId, int year, int month) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		params.put("date", date);
		params.put("adminId", adminId);
		return sqlSession.selectList(NAMESPACE + ".selectBaljuListForPay", params);
	}

	@Override
	public List<BaljuVO> selectBaljuListCriForPay(Criteria cri, String adminId, int year, int month) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		params.put("date", date);
		params.put("adminId", adminId);
		return sqlSession.selectList(NAMESPACE + ".selectBaljuListForPay", params, rowBounds);
	}

	@Override
	public int selectBaljuListCriForPayCount(String adminId, int year, int month) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		String m = Integer.toString(month);
		if(m.length() == 1) m = "0" + m;
		String date = year + "-" + m;
		
		params.put("date", date);
		params.put("adminId", adminId);
		return sqlSession.selectOne(NAMESPACE + ".selectBaljuListForPayCount", params);
	}

}
