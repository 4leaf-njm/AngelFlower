package com.dawn.angel.controller.admin;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST) 
	public String join(AdminVO admin, RedirectAttributes rttr) throws SQLException {
		adminService.createAdmin(admin);
		
		rttr.addAttribute("type", "complete");
		return "redirect:/commons/join.do";
	}
	
}
