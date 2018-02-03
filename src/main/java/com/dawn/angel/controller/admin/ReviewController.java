package com.dawn.angel.controller.admin;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.dao.AddressDAO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.domain.SearchCriteria;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.service.ReviewService;

@Controller
@RequestMapping("/admin/rev")
public class ReviewController {

	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/shiplist.do", method=RequestMethod.GET)
	public String shiplist(@ModelAttribute("m") String m, @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(6);
		List<ReviewVO> reviewList = reviewService.getReviewTotalList(cri);
		if(reviewList.size() == 0) {
			cri.setPage(cri.getPage() - 1);
			reviewList = reviewService.getReviewTotalList(cri);
		}
		int totalRevCount = reviewService.getReviewTotalListCount();
		int totalPrdCount = reviewService.getPrdTotalListCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalRevCount);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("totalRevCount", totalRevCount);
		model.addAttribute("noRevCount", orderService.getOrderListCountByComplete(null));
		model.addAttribute("totalPrdCount", totalPrdCount);
		model.addAttribute("noPrdCount", reviewService.getPrdNoListCount());
		
		return "admin/review/shiplist";
	}
	
	@RequestMapping(value="/shipreg.do", method=RequestMethod.GET)
	public String shipreg(@ModelAttribute("m") String m, @ModelAttribute("s") String s, Model model) throws SQLException {
		List<String> sidoList = addressDAO.selectSido();
		model.addAttribute("sidoList", sidoList);
		return "admin/review/shipreg";
	}
	
	@RequestMapping(value="/shipreg.do", method=RequestMethod.POST)
	public String shipreg(String m, ReviewVO review, @RequestParam("mfile") MultipartFile mfile, 
			              String orderSerial, HttpSession session) throws Exception {
		String savePath = "/resources/upload/review";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(mfile.isEmpty()) {
			review.setRevImage("default.jpg");
		} else {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			review.setRevImage(fileName);
		}
		reviewService.insertReview(review, orderSerial);
		return "redirect:shiplist.do?m=" + m;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxGugun.do", method=RequestMethod.POST)
	public List<String> ajaxGugun(@RequestParam("sido") String sido) throws SQLException {
		return  addressDAO.selectGugun(sido);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxOrderList.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxOrderList(SearchCriteria cri) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		
		List<OrderVO> orderList = orderService.getOrderListByComplete(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.getOrderListCountByComplete(cri));
		
		params.put("orderList", orderList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@RequestMapping(value="/modifyShip.do", method=RequestMethod.GET)
	public String modifyShip(@ModelAttribute("m") String m, @RequestParam("no") int reviewNo, 
			                 @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		List<String> sidoList = addressDAO.selectSido();
		ReviewVO review = reviewService.getReviewByNo(reviewNo);
		
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("review", review);
		
		return "admin/review/shipmod";
	}
	
	@RequestMapping(value="/modifyShip.do", method=RequestMethod.POST)
	public String modifyShip(String m, ReviewVO review, Criteria cri, @RequestParam("mfile") MultipartFile mfile, 
			                 HttpSession session) throws Exception {
		
		String savePath = "/resources/upload/review";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(!mfile.isEmpty()) {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			review.setRevImage(fileName);
		}
		reviewService.modifyReview(review);
		
		return "redirect:shiplist.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/removeShip.do", method=RequestMethod.GET)
	public String removeShip(String m, @RequestParam("no") int reviewNo, Criteria cri, RedirectAttributes attr) throws SQLException {
		reviewService.removeReview(reviewNo);
		attr.addFlashAttribute("msg", "정상적으로 처리되었습니다.");
		
		return "redirect:shiplist.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/prdlist.do", method=RequestMethod.GET)
	public String prdlist(@ModelAttribute("m") String m, @ModelAttribute("s") String s, 
			              @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(7);
		
		List<ReviewVO> reviewList = reviewService.getPrdTotalList(cri);
		if(reviewList.size() == 0) {
			cri.setPage(cri.getPage() - 1);
			reviewList = reviewService.getPrdTotalList(cri);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getPrdTotalListCount());
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/review/prdlist";
	}
	
	@RequestMapping(value="/prdreply.do", method=RequestMethod.POST)
	public String prdreply(String m, String s, Criteria cri, ReviewVO review, RedirectAttributes rttr) throws SQLException {
		reviewService.modifyPrdReply(review);
		rttr.addFlashAttribute("msg", "처리완료 되었습니다.");
		return "redirect:prdlist.do?m=" + m + "&s=" + s + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/prdremove.do", method=RequestMethod.GET)
	public String prdremove(String m, String s, Criteria cri, @RequestParam("no") int reviewNo, RedirectAttributes rttr) throws SQLException {
		reviewService.removeReview(reviewNo);
		rttr.addFlashAttribute("msg", "정상적으로 처리되었습니다.");
		return "redirect:prdlist.do?m=" + m + "&s=" + s + "&page=" + cri.getPage();
	}
}