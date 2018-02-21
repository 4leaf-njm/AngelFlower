package com.dawn.angel.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.service.MemberService;
import com.dawn.angel.service.OrderService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/myorder.do", method=RequestMethod.GET)
	public String myorder(HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url = "mypage/myorder";
		if(member == null) {
			url = "redirect:/commons/login.do";
		} else {
			List<OrderVO> orderList = orderService.getMyOrderList(member.getId());
			model.addAttribute("orderList", orderList);
			model.addAttribute("memName", member.getName());
		}
		return url;
	}
	
	@RequestMapping(value="/myorder_detail.do", method=RequestMethod.GET)
	public String myorder_detail(@RequestParam("no") int orderNo, Model model) throws SQLException {
		List<OrderVO> orderList = orderService.getOrderDetailList(orderNo);
		int totalPrice = 0;
		for(OrderVO order : orderList) {
			if(order.getMemId() == null) {
				totalPrice += order.getProdPrice1() * order.getQuantity();
				order.setRealPrice(order.getProdPrice1() * order.getQuantity());
			}
			else {
				totalPrice += order.getProdPrice2() * order.getQuantity();
				order.setRealPrice(order.getProdPrice2() * order.getQuantity());
			}
			if(order.getType() == 2) {
				totalPrice = order.getBaljuPrice();
				order.setRealPrice(order.getBaljuPrice());
			}
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("order", orderList.get(0));
		model.addAttribute("totalPrice", totalPrice);
		
		return "mypage/myorder_detail";
	}
	
	@RequestMapping(value="/myinfo.do", method=RequestMethod.GET)
	public String myinfo(HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url = "mypage/myinfo";
		if(member == null) {
			url = "redirect:/commons/login.do";
		} else {
			model.addAttribute("user", member);
			model.addAttribute("memName", member.getName());
		}
		return url;
	}
	
	@RequestMapping(value="/myinfo.do", method=RequestMethod.POST)
	public String myinfo(MemberVO member, RedirectAttributes rttr) throws SQLException {
		memberService.modifyMember(member);
		rttr.addFlashAttribute("msg", "회원정보 수정이 완료되었습니다.");
		return "redirect:myinfo.do";
	}
	
	@RequestMapping(value="/myexit.do", method=RequestMethod.GET)
	public String myexit(HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url = "mypage/myexit";
		if(member == null) {
			url = "redirect:/commons/login.do";
		} else {
			model.addAttribute("memName", member.getName());
		}
		return url;
	}
	
	@RequestMapping(value="/myexit.do", method=RequestMethod.POST)
	public String myexit(String id) throws SQLException {
		memberService.removeMember(id);
		return "redirect:/commons/logout.do";
	}
}
