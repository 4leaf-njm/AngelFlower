package com.dawn.angel.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.ProductService;
import com.dawn.angel.service.ReviewService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model) {
		
		return "home";
	}

	@ResponseBody
	@RequestMapping(value="/ajaxBestList.do", method=RequestMethod.POST, produces="application/json")
	public List<ProductVO> ajaxBestList(@RequestParam("menu") int category) throws SQLException {
		return productService.getProductBestList(category);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxReviewList.do", method=RequestMethod.POST, produces="application/json")
	public Map<String, Object> ajaxReviewList(@ModelAttribute("cri") Criteria cri, @RequestParam("menu") int category,
			                             @RequestParam("type") int type) throws SQLException {
		
		Map<String, Object> params = new HashMap<String, Object>();
		cri.setPerPageNum(8);
		
		List<ReviewVO> reviewList = reviewService.getReviewListByCate(cri, category, type);
		int totalCount = reviewService.getReviewListCount(category, type);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(totalCount);
		params.put("reviewList", reviewList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
}
