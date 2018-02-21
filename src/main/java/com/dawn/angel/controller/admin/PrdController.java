package com.dawn.angel.controller.admin;

import java.io.File;
import java.sql.SQLException;
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

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.service.ProductService;
import com.dawn.angel.util.AuthUtil;
import com.dawn.angel.util.MenuUtil;

@Controller
@RequestMapping("/admin/prd")
public class PrdController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AuthUtil authUtil;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(@ModelAttribute("m") String m, @ModelAttribute("cri") Criteria cri, Model model,
				       HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/product/list";
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(admin.getId(), "RIGHT_PRD_VIEW")){
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			cri.setPerPageNum(5);
			
			List<ProductVO> prodList = productService.getProductTotalListCri(cri);
			int totalCount = productService.getProductTotalCount();
			int totalOrderCount = 0;
			int useCount = 0;
			
			List<ProductVO> pList = productService.getProductTotalList();
			if(pList.size() == 0) {
				cri.setPage(cri.getPage() - 1);
				pList = productService.getProductTotalList();
			}
			for(ProductVO prod : pList) {
				int orderCount = orderService.getOrderCountByProd(prod.getProdNo());
				for(ProductVO p : prodList) {
					if(prod.getProdNo() == p.getProdNo()) {
						p.setOrderCount(orderCount);
						break;
					}
				}
				if(prod.getUseyn() == 'y') useCount ++;
				totalOrderCount += orderCount;
			}
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setDisplayPageNum(5);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalCount);
			
			model.addAttribute("prodList", prodList);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("totalOrderCount", totalOrderCount);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("useCount", useCount);
		}
		return url;
	}
	
	@RequestMapping(value="/reg.do", method=RequestMethod.GET)
	public String register(@ModelAttribute("m") String m, @ModelAttribute("s") String s, HttpSession session,
			               RedirectAttributes rttr) throws SQLException {
		String url = "admin/product/register";
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(admin.getId(), "RIGHT_PRD_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		}
		if(!authUtil.hasRole(admin.getId(), "RIGHT_PRD_INSERT")){
			url = "redirect:list.do?m=" + m;
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		}
		return url;
	}
	
	@RequestMapping(value="/reg.do", method=RequestMethod.POST)
	public String register(ProductVO product, @RequestParam("mfile")MultipartFile mfile, HttpSession session) throws Exception {
		String savePath = "/resources/upload/product";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(mfile.isEmpty()) {
			product.setImage("default.jpg");
		} else {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			product.setImage(fileName);
		}
		productService.addProduct(product);
		
		return "redirect:list.do?m=2";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modify(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @RequestParam("no") int prodNo, 
						 @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		ProductVO product = productService.getProductByNo(prodNo);
		model.addAttribute("prod", product);
		
		return "admin/product/modify";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(String m, ProductVO product, @RequestParam("mfile") MultipartFile mfile,  Criteria cri, 
			             HttpSession session, RedirectAttributes rttr) throws Exception {
		String savePath = "/resources/upload/product";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(!mfile.isEmpty()) {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			product.setImage(fileName);
		}
		productService.addProduct(product);
		rttr.addFlashAttribute("msg", "정상적으로 변경되었습니다.");
		return "redirect:list.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/remove.do", method=RequestMethod.GET)
	public String remove(String m, @RequestParam("no") int prodNo, Criteria cri, RedirectAttributes rttr) throws Exception {
		productService.removeProduct(prodNo);
		rttr.addFlashAttribute("msg", "정상적으로 처리되었습니다.");
		return "redirect:list.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxBestCount.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxBestCount(int category) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		int count = productService.getBestCountByCate(category);
		params.put("count", count);
		params.put("category", MenuUtil.getMenu(category));
		return params;
	}
}
