package com.dawn.angel.controller.admin;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.service.OrderService;

@Controller
@RequestMapping("/admin/ord")
public class OrdController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(@ModelAttribute("m") String m, @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(9);
		
		List<OrderVO> orderList = orderService.getOrderTotalListCri(cri);
		int totalCount = orderService.getOrderTotalCount();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		int countState1 = 0;
		int countState2 = 0;
		int countState3 = 0;
		int countState4 = 0;
		int countState5 = 0;
		int countState6 = 0;
		
		List<OrderVO> oList = orderService.getOrderTotalList();
		for(OrderVO o : oList) {
			if(o.getCancelyn() != 'y') {
				switch(o.getOrderState()){
				case 1:
					countState1 ++;
					break;
				case 2:
					countState2 ++;
					break;
				case 3:
					countState3 ++;
					break;
				case 4:
					countState4 ++;
					break;
				}
			}
			if(o.getReviewyn() == 'y') countState5 ++;
			if(o.getCancelyn() == 'y') countState6 ++;
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("countState1", countState1);
		model.addAttribute("countState2", countState2);
		model.addAttribute("countState3", countState3);
		model.addAttribute("countState4", countState4);
		model.addAttribute("countState5", countState5);
		model.addAttribute("countState6", countState6);
		
		return "admin/order/list";
	}
	
	@RequestMapping(value="/depwait.do", method=RequestMethod.GET)
	public String depwait(@ModelAttribute("m") String m, @ModelAttribute("s") String s, 
			              @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(11);
		
		List<OrderVO> orderList = orderService.getOrderDepList(cri);
		if(orderList.size() == 0) {
			cri.setPage(cri.getPage()-1);
			orderList = orderService.getOrderDepList(cri);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.getOrderDepCount());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/order/depwait";
	}
	
	@RequestMapping(value="/modifydep.do", method=RequestMethod.GET)
	public String depwait(String m, String s, Criteria cri, @RequestParam("no") int orderNo, 
			              RedirectAttributes rttr) throws SQLException {
		orderService.modifyOrderDep(orderNo);
		rttr.addFlashAttribute("msg", "정상적으로 처리되었습니다. 배송상태 관리 메뉴로 이동됩니다.");
		
		return "redirect:depwait.do?m=" + m + "&s=" + s + "&no=" + orderNo + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/shipwait.do", method=RequestMethod.GET)
	public String shipwait(@ModelAttribute("m") String m, @ModelAttribute("s") String s, 
                           @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(11);
		
		List<OrderVO> orderList = orderService.getOrderShipList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.getOrderShipCount());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/order/shipwait";
	}
	
	@RequestMapping(value="/modifyship.do", method=RequestMethod.GET)
	public String shipwait(String m, String s, Criteria cri, @RequestParam("no") int orderNo, 
			               @RequestParam("state") int orderState, RedirectAttributes rttr) throws SQLException {
		orderService.modifyOrderShip(orderNo, orderState);
		rttr.addFlashAttribute("msg", "정상적으로 처리되었습니다.");
		
		return "redirect:shipwait.do?m=" + m + "&s=" + s + "&no=" + orderNo + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/cancel.do", method=RequestMethod.GET)
	public String cancel(@ModelAttribute("m") String m, @ModelAttribute("s") String s, 
					     @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(11);
		
		List<OrderVO> orderList = orderService.getOrderCancelList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.getOrderCancelCount());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/order/cancel";
	}
	
	@RequestMapping(value="/modifyCancel.do", method=RequestMethod.GET)
	public String cancel(String m, String s, Criteria cri, @RequestParam("no") int orderNo, 
            @RequestParam("cancel") int cancel, RedirectAttributes rttr) throws SQLException {
		orderService.modifyOrderCancel(orderNo, cancel);
		rttr.addFlashAttribute("msg", "정상적으로 처리되었습니다.");
		
		return "redirect:cancel.do?m=" + m + "&s=" + s + "&no=" + orderNo + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET) 
	public String detail(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @RequestParam("no") int orderNo,
					     @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		
		List<OrderVO> orderList = orderService.getOrderDetailList(orderNo);
		OrderVO order = orderService.getOrderByNo(orderNo);
		
		int totalPrice = 0;
		int totalSave = 0;
		int finalPrice = 0;
		for(OrderVO o : orderList) {
			if(o.getMemId() == null) 
				totalPrice += o.getProdPrice1() * o.getQuantity();
			else
				totalPrice += o.getProdPrice2() * o.getQuantity();
			totalSave += o.getProdSave() * o.getQuantity();
		}
		if(order.getType() == 2) {
			totalPrice = order.getBaljuPrice();
			totalSave = 0;
		}
		finalPrice = totalPrice - order.getUseSave();
		
		model.addAttribute("order", order);
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalSave", totalSave);
		model.addAttribute("finalPrice", finalPrice);
		
		return "admin/order/detail";
	}
}
