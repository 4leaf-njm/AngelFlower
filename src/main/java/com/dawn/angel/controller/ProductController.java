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

import com.dawn.angel.domain.CommentVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.ProductService;
import com.dawn.angel.service.ReviewService;
import com.dawn.angel.util.MenuUtil;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired 
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/list.do")
	public String productList(@RequestParam("menu") int no, Model model) throws SQLException{
		Criteria cri = new Criteria();
		cri.setPerPageNum(8);
		
		List<ProductVO> prodList = productService.getProductList(no);
		List<ReviewVO> reviewList = reviewService.getReviewListByCate(cri, no, 0);
		int totalCount = reviewService.getReviewListCount(no, 0);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		String menu = MenuUtil.getMenu(no);
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("menu", menu);
		model.addAttribute("pageMaker", pageMaker);
		
		return "product/productList";
	}
	
	@RequestMapping("/detail.do")
	public String productDetail(@RequestParam("no") int prodNo, Model model) throws SQLException{
		List<ProductVO> relList = productService.getProductListRel(prodNo);
		List<CommentVO> comList = reviewService.getCommentListByProd(prodNo);
		ProductVO product = productService.getProductByNo(prodNo);
		String menu = MenuUtil.getMenu(product.getCategory());
		
		model.addAttribute("relList", relList);
		model.addAttribute("comList", comList);
		model.addAttribute("prod", product);
		model.addAttribute("menu", menu);
		return "product/productDetail";
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
