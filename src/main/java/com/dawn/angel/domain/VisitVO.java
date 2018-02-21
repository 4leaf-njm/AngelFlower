package com.dawn.angel.domain;

import java.sql.Timestamp;

public class VisitVO { // 방문자 카운트
	private Timestamp visitDate; // 방문일자

	public Timestamp getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Timestamp visitDate) {
		this.visitDate = visitDate;
	}

	@Override
	public String toString() {
		return "VisitVO [visitDate=" + visitDate + "]";
	}
}
