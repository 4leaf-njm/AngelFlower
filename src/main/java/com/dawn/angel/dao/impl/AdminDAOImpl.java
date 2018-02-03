package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.AdminDAO;
import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.SearchCriteria;

public class AdminDAOImpl implements AdminDAO{
	
	private static final String NAMESPACE = "Admin-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertAdmin(AdminVO admin) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertAdmin", admin);
	}

	@Override
	public void updateAdmin(AdminVO admin) throws SQLException {
	}

	@Override
	public void deleteAdmin(String id) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteAdmin", id);
	}

	@Override
	public AdminVO selectAdminById(String id) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectAdminById", id);
	}

	@Override
	public List<AdminVO> selectAdminList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectAdminList");
	}

	@Override
	public List<AdminVO> selectAdminListByCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(NAMESPACE + ".selectAdminList", null, rowBounds);
	}

	@Override
	public List<AdminVO> selectAdminListBySearch(SearchCriteria cri) throws SQLException {
		return null;
	}

	@Override
	public List<AdminVO> selectAdminListForPermit(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList(NAMESPACE + ".selectAdminListForPermit", null, rowBounds);
	}

	@Override
	public int selectAdminListCountForPermit() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectAdminListCountForPermit");
	}

	@Override
	public void updateAdminPermitYes(String id) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateAdminPermitYes", id);
	}
	

	@Override
	public void updateAdminPermitNo(String id) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateAdminPermitNo", id);
	}

	@Override
	public List<AdminVO> selectAdminListSearch(SearchCriteria cri, String adminId) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		params.put("cri", cri);
		params.put("adminId", adminId);
		
		return sqlSession.selectList(NAMESPACE + ".selectAdminListSearch", params, rowBounds);
	}

	@Override
	public int selectAdminListSearchCount(SearchCriteria cri, String adminId) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cri", cri);
		params.put("adminId", adminId);
		
		return sqlSession.selectOne(NAMESPACE + ".selectAdminListSearchCount", params);
	}

}
