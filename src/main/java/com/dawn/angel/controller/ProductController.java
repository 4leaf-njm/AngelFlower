package com.dawn.angel.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dawn.angel.domain.CommentVO;
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
		List<ProductVO> prodList = productService.getProductList(no);
		List<ReviewVO> reviewList = reviewService.getReviewListByCate(no);
		String menu = MenuUtil.getMenu(no);
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("menu", menu);
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
}
