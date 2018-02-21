package com.dawn.angel.controller.admin;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.MemberService;
import com.dawn.angel.service.NoticeService;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.service.ReviewService;
import com.dawn.angel.util.AuthUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AuthUtil authUtil;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model, HttpSession session) throws SQLException {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		Criteria cri = new Criteria();
		cri.setPerPageNum(6);
		List<NoticeVO> noticeList = noticeService.getNoticeListCri(cri);
		List<ReviewVO> reviewList = reviewService.getPrdTotalList(cri);
		List<OrderVO> orderList = null;
		if(authUtil.isAdmin(loginUser.getId())) {
			orderList = orderService.getOrderTotalList();
		}
		else {
			orderList = orderService.getOrderTotalListForBalju(loginUser.getId());
		}
		int orderState1 = 0;
		int orderState2 = 0;
		int orderState3 = 0;
		int orderState4 = 0;
		for(OrderVO order : orderList) {
			if(order.getOrderState() == 1 && order.getCancelyn() != 'y')
				orderState1 ++;
			if(order.getOrderState() == 2 && order.getCancelyn() != 'y')
				orderState2 ++;
			if(order.getOrderState() == 3 && order.getCancelyn() != 'y')
				orderState3 ++;
			if(order.getOrderState() == 4 && order.getReviewyn() == 'n' && order.getCancelyn() != 'y')
				orderState4 ++;
		}
		int memberDayNewCount = memberService.getMemberCountThisDay();
		int adminDayNewCount = adminService.getAdminCountThisDay();
		int dayNewCount = memberDayNewCount + adminDayNewCount;
		int memberMonthNewCount = memberService.getMemberCountThisMonth();
		int adminMonthNewCount = adminService.getAdminCountThisMonth();
		int monthNewCount = memberMonthNewCount + adminMonthNewCount;
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("orderState1", orderState1);
		model.addAttribute("orderState2", orderState2);
		model.addAttribute("orderState3", orderState3);
		model.addAttribute("orderState4", orderState4);
		model.addAttribute("dayNewCount", dayNewCount);
		model.addAttribute("monthNewCount", monthNewCount);
		model.addAllAttributes(orderService.getOrderListThisMonth());
		model.addAllAttributes(orderService.getOrderListThisDay());
		return "admin/home";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST) 
	public String join(AdminVO admin, RedirectAttributes rttr) throws SQLException {
		adminService.createAdmin(admin);
		rttr.addAttribute("type", "complete");
		rttr.addAttribute("user", "ad");
		return "redirect:/commons/join.do";
	}
	
	@RequestMapping(value="/mypage/myinfo.do", method=RequestMethod.GET)
	public String myinfo(HttpSession session, Model model) throws SQLException {
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		String url = "admin/mypage/myinfo";
		if(admin == null) {
			url = "redirect:/commons/login.do";
		} else {
			model.addAttribute("user", admin);
			model.addAttribute("memName", admin.getName());
		}
		return url;
	}
	
	@RequestMapping(value="/mypage/myinfo.do", method=RequestMethod.POST)
	public String myinfo(AdminVO admin, RedirectAttributes rttr) throws SQLException {
		adminService.modifyAdmin(admin);
		rttr.addFlashAttribute("msg", "회원정보 수정이 완료되었습니다.");
		return "redirect:myinfo.do";
	}
	
	@RequestMapping(value="/mypage/myexit.do", method=RequestMethod.GET)
	public String myexit(HttpSession session, Model model) throws SQLException {
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		String url = "admin/mypage/myexit";
		if(admin == null) {
			url = "redirect:/commons/login.do";
		} else {
			model.addAttribute("memName", admin.getName());
		}
		return url;
	}
	
	@RequestMapping(value="/mypage/myexit.do", method=RequestMethod.POST)
	public String myexit(String id) throws SQLException {
		adminService.removeAdmin(id);
		return "redirect:/commons/logout.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/hasRole.do", method=RequestMethod.POST)
	public boolean hasRole(@RequestParam("role") String role, HttpSession session) throws SQLException {
		AdminVO admin = (AdminVO)session.getAttribute("loginUser");
		return authUtil.hasRole(admin.getId(), role);
	}
}
