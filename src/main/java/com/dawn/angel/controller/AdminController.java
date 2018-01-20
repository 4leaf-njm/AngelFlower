package com.dawn.angel.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="join.do", method=RequestMethod.POST) 
	public String join(AdminVO admin, HttpSession sesison) throws SQLException {
		adminService.createAdmin(admin);
		return "redirect:/commons/login.do";
	}
}
