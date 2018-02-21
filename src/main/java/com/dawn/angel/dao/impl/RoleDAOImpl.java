package com.dawn.angel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dawn.angel.dao.RoleDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.RoleVO;

public class RoleDAOImpl implements RoleDAO{

	private static final String NAMESPACE = "Role-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertRole(RoleVO role) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertRole", role);
	}

	@Override
	public void insertAuth(RoleVO role) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertAuth", role);
	}

	@Override
	public int selectRoleMaxNo() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectRoleMaxNo");
	}

	@Override
	public List<RoleVO> selectRoleList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectRoleList");
	}
	
	@Override
	public List<RoleVO> selectRoleListCri(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE + ".selectRoleList", null, rowBounds);
	}

	@Override
	public int selectRoleListCount() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectRoleListCount");
	}

	@Override
	public void deleteRole(int roleNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteRole", roleNo);
	}

	@Override
	public void deleteAuth(int roleNo) throws SQLException {
		sqlSession.update(NAMESPACE + ".deleteAuth", roleNo);
	}

	@Override
	public List<RoleVO> selectAuthListByRole(int roleNo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectAuthListByRole", roleNo);
	}

	@Override
	public void updateRole(RoleVO role) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateRole", role);
	}

	@Override
	public RoleVO selectRoleByNo(int roleNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectRoleByNo", roleNo);
	}

}
