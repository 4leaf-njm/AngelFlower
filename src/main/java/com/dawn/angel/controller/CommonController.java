package com.dawn.angel.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.MemberService;

@Controller
@RequestMapping("/commons")
public class CommonController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private AdminService adminService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join(String type, Model model) {
		model.addAttribute("type", type);
		return "commons/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(MemberVO member, RedirectAttributes rttr) throws SQLException{
		memberService.createMember(member);
		rttr.addAttribute("type", "complete");
		return "redirect:join.do";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "commons/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(String id, String pw, HttpSession session, Model model) throws SQLException{
		String url = "redirect:/home.do";
		MemberVO member = memberService.getMemberById(id);
		AdminVO admin = adminService.getAdminById(id);
		
		String msg = null;
		if(member == null && admin == null) { 
			url = "commons/login";
			msg = "아이디가 존재하지 않습니다.";
		} else {
			if(member != null) {
				if(!member.getPwd().equals(pw)) { 
					url = "commons/login";
					msg = "비밀번호가 일치하지 않습니다.";
				} else {
					session.setAttribute("loginUser", member);
					session.setAttribute("loginType", "member");
				}
			}
			
			if(admin != null) {
				if(!admin.getPwd().equals(pw)) { 
					url = "commons/login";
					msg = "비밀번호가 일치하지 않습니다.";
				} else {
					session.setAttribute("loginUser", admin);
					session.setAttribute("loginType", "admin");
				}
			}
		}
		model.addAttribute("msg", msg);
		
		return url;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxIdCheck.do", method=RequestMethod.POST, produces={"application/json"})
	public int ajaxIdCheck(String id) throws SQLException {
		MemberVO member = memberService.getMemberById(id);
		AdminVO admin = adminService.getAdminById(id);
		int result;
		
		if(member == null && admin == null) 
			result = 1;
		else 
			result = 0;
		
		return result;
	}
	
	@RequestMapping(value="/find.do", method=RequestMethod.GET)
	public String find() throws SQLException {
		return "commons/find";
	}
}
