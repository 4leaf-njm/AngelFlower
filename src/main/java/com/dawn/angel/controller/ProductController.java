package com.dawn.angel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@RequestMapping("/productList.do")
	public String productList(){
		return "product/productList";
	}
	
	@RequestMapping("/productDetail.do")
	public String productDetail(){
		return "product/productDetail";
	}
}
