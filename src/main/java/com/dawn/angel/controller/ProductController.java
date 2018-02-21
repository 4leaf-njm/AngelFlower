package com.dawn.angel.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.dawn.angel.dao.AddressDAO;
import com.dawn.angel.domain.AddressVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductRequest;
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
	
	@Autowired
	private AddressDAO addressDAO;
	
	@RequestMapping("/list.do")
	public String productList(@RequestParam("menu") int category, @RequestParam(value="sort", defaultValue="1") int sort, 
			                  @ModelAttribute("cri") Criteria cri, Model model) throws SQLException{
		cri.setPerPageNum(5);
		List<ProductVO> prodList = productService.getProductListCri(category, cri, sort);
		List<String> sidoList = addressDAO.selectSido();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.getProductListCriCount(category));
		
		String menu = MenuUtil.getMenu(category);
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("menu", menu);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		
		return "product/productList";
	}
	
	@RequestMapping("/detail.do")
	public String productDetail(int menu, @RequestParam("no") int prodNo, @RequestParam(value="sort", defaultValue="1") int sort, @ModelAttribute("cri") Criteria cri,
			                    Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException{
		List<ProductVO> relList = productService.getProductListRel(prodNo);
		List<ReviewVO> comList = reviewService.getPrdListByNo(prodNo);
		ProductVO product = productService.getProductByNo(prodNo);
		String category = MenuUtil.getMenu(product.getCategory());
		
		for(ReviewVO review : comList) {
			if(review.getMemId() == null) 
				review.setMemId("비회원");
		}
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cook : cookies) {
				if(cook.getName().equals("item" + prodNo)){
					cook.setMaxAge(0);
					cook.setPath("/");
					response.addCookie(cook);
				}
			}
		}
		Cookie cookie = new Cookie("item" + prodNo, prodNo + "");
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24 * 10);
		response.addCookie(cookie);
		
		model.addAttribute("relList", relList);
		model.addAttribute("comList", comList);
		model.addAttribute("prod", product);
		model.addAttribute("menu", category);
		model.addAttribute("sort", sort);
		model.addAttribute("m", menu);
		return "product/productDetail";
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
	
	@RequestMapping(value="/clist.do", method=RequestMethod.GET)
	public String cateList(@RequestParam(value="no", defaultValue="0") int no, Model model, ProductRequest req) throws SQLException {
		List<ProductVO> prodList = new ArrayList<ProductVO>();
		String title = "";
		String subtit = "";
		int menu = 0;
		switch(no) {
		case 0:
			prodList = productService.getProductSearch(req);
			break;
		case 1:
			menu = 1;
			title = "추모.근조";
			subtit = "추모, 영결실 같은 애사가 있을 때, 삼가 고인의 명복을 빌며 애도의 마음을 담아 전합니다.";
			prodList = productService.getProductList(1);
			List<ProductVO> tempList = productService.getProductList(2);
			for(ProductVO prod : tempList) 
				prodList.add(prod);
			break;
		case 2:
			menu = 3;
			title = "결혼.축하";
			subtit = "각종 행사장을 화려하고, 더욱 아름답게 기쁜 날이 될 수 있도록 빛내주는 주인공으로 만들어 드립니다.";
			prodList = productService.getProductList(3);
			break;
		case 3:
			menu = 6;
			title = "승진&취임";
			subtit = "영전, 취임, 승진 등 품격있는 자리의 선물로, 보내시는 분의 정성이 돋보입니다.";
			prodList = productService.getProductList(6);
			break;
		case 4:
			menu = 6;
			title = "개업&이전";
			subtit = "각종 오픈식 및 특별한 행사에 축하의 마음을 전달하세요.";
			prodList = productService.getProductList(6);
			break;
		case 5:
			menu = 4;
			title = "생일&기념일";
			subtit = "기쁘고 좋은 날 꽃바구니로 사랑의 마음을 전하세요. 전문 플로리스트가 싱싱하고 신선한 재료로 최고의 상품을 만들어 드립니다.";
			prodList = productService.getProductList(4);
			List<ProductVO> tmpList = productService.getProductList(5);
			for(ProductVO prod : tmpList) 
				prodList.add(prod);
			break;
		}
		model.addAttribute("menu", menu);
		model.addAttribute("title", title);
		model.addAttribute("subtit", subtit);
		model.addAttribute("prodList", prodList);
		model.addAttribute("count", prodList.size());
		return "product/cateList";
	}
	
	@RequestMapping(value="/review_reg.do", method=RequestMethod.POST)
	public String reviewReg(ReviewVO review, @RequestParam("mfile") MultipartFile mfile, HttpSession session) throws Exception {
		if(review.getMemId().equals("")) review.setMemId(null);
		
		String savePath = "/resources/upload/review";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(mfile.isEmpty()) {
			review.setComImage("default.jpg");
		} else {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			review.setComImage(fileName);
		}
		reviewService.insertPrdReview(review);
		return "redirect:detail.do?menu=" + review.getCategory() + "&no=" + review.getProdNo();
	}
}
