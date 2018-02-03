package com.dawn.angel.controller.admin;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.BaljuVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.BaljuService;
import com.dawn.angel.service.MemberService;
import com.dawn.angel.service.OrderService;

@Controller
@RequestMapping("/admin/mb")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BaljuService baljuService;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(@ModelAttribute("m") String m, Model model) throws SQLException {
		List<MemberVO> memList = memberService.getMemberList();
		List<AdminVO> adminList = adminService.getAdminList();
		List<BaljuVO> baljuList = baljuService.getBaljuTotalList();
		
		int orderCount = 0;
		int leaveCount = 0;
		for(MemberVO member : memList) {
			orderCount += orderService.getOrderCountById(member.getId());
			if(member.getUseyn() == 'n') 
				leaveCount ++;
		} 
		for(AdminVO admin : adminList) {
			if(admin.getUseyn() == 'n')
				leaveCount ++;
		}
		
		model.addAttribute("memList", memList);
		model.addAttribute("adminList", adminList);
		model.addAttribute("memCount", memList.size());
		model.addAttribute("adminCount", adminList.size());
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("leaveCount", leaveCount);
		model.addAttribute("totalBaljuCount", baljuList.size());
		
		return "admin/member/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxMemberPaging.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxMemberPaging(Criteria cri) throws SQLException {
		cri.setPerPageNum(5);
		Map<String, Object> params = new HashMap<String, Object>();
		List<MemberVO> memList = memberService.getMemberListByCri(cri);
		
		for(MemberVO member : memList) {
			int count = orderService.getOrderCountById(member.getId());
			member.setOrderCount(count);
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.getMemberList().size());
		
		params.put("memList", memList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAdminPaging.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxAdminPaging(Criteria cri) throws SQLException {
		cri.setPerPageNum(5);
		Map<String, Object> params = new HashMap<String, Object>();
		List<AdminVO> adminList = adminService.getAdminListByCri(cri);
		List<BaljuVO> baljuList = baljuService.getBaljuTotalList();
		
		for(AdminVO admin : adminList) {
			int baljuCount = 0;
			for(BaljuVO balju : baljuList) {
				if(admin.getId().equals(balju.getBaljuSendId())){
					baljuCount ++;
				}
			}
			admin.setBaljuCount(baljuCount);
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getAdminList().size());
		
		params.put("adminList", adminList);
		params.put("pageMaker", pageMaker);
		
		return params;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxLeave.do", method=RequestMethod.POST)
	public Map<String, Object> leave(@ModelAttribute("m") String m, String type, String id) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		if(type.equals("m"))
			memberService.removeMember(id);
		else 
			adminService.removeAdmin(id);
		params.put("msg", "정상적으로 처리되었습니다.");
		return params;
	}
	
	@RequestMapping(value="/permit.do", method=RequestMethod.GET)
	public String permit(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri, Model model) throws SQLException {
		cri.setPerPageNum(13);
		
		List<AdminVO> adminList = adminService.getAdminListForPermit(cri);
		if(adminList.size() == 0) {
			cri.setPage(cri.getPage() - 1);
			adminList = adminService.getAdminListForPermit(cri);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getAdminListCountForPermit());
		
		model.addAttribute("adminList", adminList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/member/permit";
	}
	
	@RequestMapping(value="/permitYes.do", method=RequestMethod.GET)
	public String permitYes(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri, String id) throws SQLException {
		adminService.modifyAdminPermitYes(id);
		return "redirect:permit.do";
	}
	
	@RequestMapping(value="/permitNo.do", method=RequestMethod.GET)
	public String permitNo(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri, String id) throws SQLException {
		adminService.modifyAdminPermitNo(id);
		return "redirect:permit.do";
	}
}
