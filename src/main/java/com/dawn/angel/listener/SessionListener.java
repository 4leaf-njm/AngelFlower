package com.dawn.angel.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dawn.angel.dao.VisitDAO;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent e) {
		HttpSession session = e.getSession();
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        VisitDAO visitDAO = (VisitDAO) ctx.getBean("visitDAO");
        try {
            if(session.isNew()) {
            	int todayCount = 0;
            	int monthCount = 0;
    			visitDAO.insertVisit();
    			todayCount = visitDAO.selectVisitTodayCount();
    			monthCount = visitDAO.selectVisitMonthCount();
    			session.setAttribute("todayVisitCount", todayCount);
    			session.setAttribute("monthVisitCount", monthCount);
            }
        } catch(Exception ex) {
        	ex.printStackTrace();
        }
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent e) {}
}
