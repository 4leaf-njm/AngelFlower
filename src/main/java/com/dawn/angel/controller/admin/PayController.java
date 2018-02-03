package com.dawn.angel.controller.admin;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.PayVO;
import com.dawn.angel.domain.SearchCriteria;
import com.dawn.angel.service.BaljuService;
import com.dawn.angel.service.OrderService;

@Controller
@RequestMapping("/admin/pay")
public class PayController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BaljuService baljuService;
	
	@RequestMapping(value="/totsale.do", method=RequestMethod.GET)
	public String totsale(@ModelAttribute("m") String m, @RequestParam("y") int year, Model model) throws SQLException {
		List<PayVO> payList = orderService.getPayListForTotSale(year);
		
		int orderCount = 0;
		int orderMoney = 0;
		int compleCount = 0;
		int totalMoney = 0;
		for(PayVO pay : payList) {
			orderCount += pay.getOrderCount();
			orderMoney += pay.getOrderMoney();
			compleCount += pay.getCompleCount();
			totalMoney += pay.getTotalMoney();
		}
		model.addAttribute("payList", payList);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("orderMoney", orderMoney);
		model.addAttribute("compleCount", compleCount);
		model.addAttribute("totalMoney", totalMoney);
		return "admin/pay/totsale";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxPayDetailList.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxPayDetailList(SearchCriteria cri, int year, int month) throws SQLException {
		cri.setPerPageNum(10);
		Map<String, Object> params = new HashMap<String, Object>();
		List<OrderVO> payList = orderService.getOrderListForPay(year, month, cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(orderService.getOrderSearchListForPayCount(year, month, cri));
		
		params.put("payList", payList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@RequestMapping(value="/bjsale.do", method=RequestMethod.GET)
	public String bjsale(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @RequestParam("y") int year, 
			             Model model, HttpSession session) throws SQLException {
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		List<PayVO> payList = baljuService.getBaljuListForPay(admin.getId(), year);
		
		int sendCount = 0;
		int totalSendMoney = 0;
		int sendMoney = 0;
		int recCount = 0;
		int totalRecMoney = 0;
		int totalBaljuMoney = 0;
		for(PayVO pay : payList) {
			sendCount += pay.getSendCount();
			totalSendMoney += pay.getTotalSendMoney();
			sendMoney += pay.getSendMoney();
			recCount += pay.getRecCount();
			totalRecMoney += pay.getTotalRecMoney();
			totalBaljuMoney += pay.getTotalBaljuMoney();
		}
		model.addAttribute("payList", payList);
		model.addAttribute("sendCount", sendCount);
		model.addAttribute("totalSendMoney", totalSendMoney);
		model.addAttribute("sendMoney", sendMoney);
		model.addAttribute("recCount", recCount);
		model.addAttribute("totalRecMoney", totalRecMoney);
		model.addAttribute("totalBaljuMoney", totalBaljuMoney);
		
		return "admin/pay/bjsale";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxBaljuDetailList.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxBaljuDetailList(Criteria cri, int year, int month, HttpSession session) throws SQLException {
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		cri.setPerPageNum(10);
		Map<String, Object> params = new HashMap<String, Object>();
		List<BaljuVO> payList = baljuService.getBaljuListCriForPay(cri, admin.getId(), year, month);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(baljuService.getBaljuListCriForPayCount(admin.getId(), year, month));
		
		params.put("payList", payList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
}
