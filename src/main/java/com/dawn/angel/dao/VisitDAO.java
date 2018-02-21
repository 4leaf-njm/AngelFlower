package com.dawn.angel.dao;

import java.sql.SQLException;

public interface VisitDAO {
	
	public int selectVisitTodayCount() throws SQLException;
	
	public int selectVisitMonthCount() throws SQLException;
	
	public void insertVisit() throws SQLException;
	
}
