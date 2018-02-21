package com.dawn.angel.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dawn.angel.dao.AddressDAO;
import com.dawn.angel.domain.AddressVO;
import com.dawn.angel.domain.BannerVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.ReviewVO;
import com.dawn.angel.service.ProductService;
import com.dawn.angel.service.ReviewService;
import com.dawn.angel.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException {
		List<String> sidoList = addressDAO.selectSido();
		List<BannerVO> bannerList = storeService.getBannerList();
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("bannerList", bannerList);
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
			                             @RequestParam("type") int type, AddressVO address) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		cri.setPerPageNum(8);
		
		List<ReviewVO> reviewList = reviewService.getReviewListByCate(cri, category, type);
		int totalCount = reviewService.getReviewListCount(category, type);
		int count = 0;
		if(address.getSido() != null && address.getSido() != "") {
			for(int i=0; i<reviewList.size(); i++) {
				String sido = reviewList.get(i).getRevRegion().substring(0, 2);
				if(!sido.equals(address.getSido())) {
					reviewList.remove(i);
					count ++;
					i --;
				}
			}
		}
		if(address.getGugun() != null && address.getGugun() != "") {
			for(int i=0; i<reviewList.size(); i++) {
				String region = reviewList.get(i).getRevRegion().trim();
				String gugun = region.substring(2, region.length()).trim();
				if(!gugun.equals(address.getGugun())) {
					reviewList.remove(i);
					count ++;
					i --;
				}
			}
		}
		for(ReviewVO review : reviewList) {
			if(review.getType() == 1) {
				String title = review.getRevTitle();
				title = title.replace(title.substring(title.length()-1, title.length()), "*") + " 님";
				review.setRevTitle(title);
			} else {
				if(review.getMemId() == null || review.getMemId() == "")
					review.setMemId("비회원");
			}
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount - count);
	
		params.put("reviewList", reviewList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxGugun.do", method=RequestMethod.POST)
	public List<String> ajaxGugun(@RequestParam("sido") String sido) throws SQLException {
		return  addressDAO.selectGugun(sido);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxQuickList.do", method=RequestMethod.POST)
	public List<ProductVO> ajaxQuickList(String strno) throws SQLException {
		List<ProductVO> prodList = new ArrayList<ProductVO>();
		if(!strno.equals("")) {
			String[] list = strno.split(",");
			for(String prodNo : list) {
				ProductVO product = productService.getProductByNo(Integer.parseInt(prodNo));
				if(product != null)
					prodList.add(product);
			}
		}
		return prodList;
	}
	
}
