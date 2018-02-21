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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.SearchCriteria;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.BaljuService;
import com.dawn.angel.service.ProductService;
import com.dawn.angel.util.AuthUtil;

@Controller
@RequestMapping("/admin/bj")
public class BaljuController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BaljuService baljuService;
	
	@Autowired
	private AuthUtil authUtil;
	
	@RequestMapping(value="/reclist.do", method=RequestMethod.GET)
	public String reclist(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri,
			              Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/balju/reclist";
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(admin.getId(), "RIGHT_BJ_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			if(admin != null) {
				List<BaljuVO> baljuList = baljuService.getBaljuRecList(cri, admin.getId());
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setDisplayPageNum(5);
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(baljuService.getBaljuRecListCount(admin.getId()));
				
				model.addAttribute("baljuList", baljuList);
				model.addAttribute("pageMaker", pageMaker);
			}
		}
		return url;
	}
	
	@RequestMapping(value="/sendlist.do", method=RequestMethod.GET)
	public String sendlist(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri,
                           Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/balju/sendlist";
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(admin.getId(), "RIGHT_BJ_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			if(admin != null) {
				List<BaljuVO> baljuList = baljuService.getBaljuSendList(cri, admin.getId());
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setDisplayPageNum(5);
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(baljuService.getBaljuSendListCount(admin.getId()));
				
				model.addAttribute("baljuList", baljuList);
				model.addAttribute("pageMaker", pageMaker);
			}
		}
		return url;
	}
	
	@RequestMapping(value="/reg.do", method=RequestMethod.GET)
	public String register(@ModelAttribute("m") String m, @ModelAttribute("s") String s,
						   HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url =  "admin/balju/register";
		AdminVO admin = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(admin.getId(), "RIGHT_BJ_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else if(!authUtil.hasRole(admin.getId(), "RIGHT_BJ_INSERT")) {
			url = "redirect:reclist.do?m=" + m;
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		}
		return url;
	}
	
	@RequestMapping(value="/reg.do", method=RequestMethod.POST)
	public String register(@ModelAttribute("m") String m, BaljuVO balju, RedirectAttributes rttr,
						   int[] prodArr, int[] quentArr) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("prodArr", prodArr);
		params.put("quentArr", quentArr);
		
		baljuService.insertBalju(balju, params);
		rttr.addFlashAttribute("msg", "발주 신청이 완료되었습니다. 해당 회원의 승인 후 주문처리 됩니다.");
		return "redirect:sendlist.do?m=" + m + "&s=2";
	}
	
	@RequestMapping(value="/permit.do", method=RequestMethod.GET)
	public String permit(String m, String s, Criteria cri, @RequestParam("no") int baljuNo, RedirectAttributes rttr) throws SQLException {
		baljuService.modifyBaljuCheck(baljuNo);
		
		rttr.addFlashAttribute("msg", "승인되었습니다. 주문관리 메뉴에서 관리하실 수 있습니다.");
		return "redirect:reclist.do?m=" + m + "&s=" + s + "&page=" + cri.getPage();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxProdList.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxProdList(SearchCriteria cri) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		cri.setPerPageNum(4);
		
		List<ProductVO> prodList = productService.getProductListSearch(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.getProductListSearchCount(cri));
		
		params.put("prodList", prodList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAdminList.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxAdminList(SearchCriteria cri, @RequestParam("id") String adminId) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		cri.setPerPageNum(5);

		List<AdminVO> adminList = adminService.getAdminListSearch(cri, adminId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getAdminListSearchCount(cri, adminId));
		
		params.put("adminList", adminList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detail(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @RequestParam("no") int baljuNo,
			             Model model) throws SQLException {
		List<BaljuVO> baljuList = baljuService.getBaljuDetail(baljuNo);
		BaljuVO balju = baljuService.getBaljuByNo(baljuNo);
		
		model.addAttribute("baljuList", baljuList);
		model.addAttribute("balju", balju);
		return "admin/balju/detail";
	}
}
