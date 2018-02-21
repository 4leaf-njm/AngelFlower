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
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.domain.RoleVO;
import com.dawn.angel.service.AdminService;
import com.dawn.angel.service.BaljuService;
import com.dawn.angel.service.MemberService;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.service.RoleService;
import com.dawn.angel.util.AuthUtil;

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
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AuthUtil authUtil;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(@ModelAttribute("m") String m, Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/member/list";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_MB_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
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
		}
		return url;
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
			RoleVO role = roleService.getRoleByNo(admin.getRoleNo());
			if(role != null)
				admin.setRoleName(role.getRoleName());
			else
				admin.setRoleName("");
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
	public String permit(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri, Model model,
			             HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/member/permit";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_MB_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
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
		}
		return url;
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
	
	@RequestMapping(value="/auth.do", method=RequestMethod.GET)
	public String auth(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri, 
		               Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/member/auth";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_MB_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			cri.setPerPageNum(5);
			List<RoleVO> roleList = roleService.getRoleListCri(cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setDisplayPageNum(5);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(roleService.getRoleListCount());
			
			model.addAttribute("roleList", roleList);
			model.addAttribute("pageMaker", pageMaker);
		}
		return url;
	}
	
	@RequestMapping(value="/authInsert.do", method=RequestMethod.POST)
	public String auth(String m, String s, @RequestParam("authList") String auth, RoleVO role, RedirectAttributes rttr) throws SQLException {
		String[] authList = auth.split(",");
		roleService.insertRole(role, authList);
		rttr.addFlashAttribute("msg", "권한 생성이 완료되었습니다.");
		return "redirect:auth.do?m=" + m + "&s=" + s;
	}
	
	@RequestMapping(value="/authModify.do", method=RequestMethod.POST)
	public String authModify(String m, String s, Criteria cri, @RequestParam("authList") String auth, 
			                 RoleVO role, RedirectAttributes rttr) throws SQLException {
		String[] authList = auth.split(",");
		roleService.modifyRole(role, authList);
		rttr.addFlashAttribute("msg", "권한 수정이 완료되었습니다.");
		return "redirect:auth.do?m=" + m + "&s=" + s + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/authRemove.do", method=RequestMethod.GET)
	public String authRemove(String m, String s, Criteria cri, @RequestParam("no") int roleNo, RedirectAttributes rttr) throws SQLException {
		roleService.removeRole(roleNo);
		rttr.addFlashAttribute("msg", "권한 삭제가 완료되었습니다.");
		return "redirect:auth.do?m=" + m + "&s=" + s + "&page=" + cri.getPage();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAuth.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxAuth(@RequestParam("no") int roleNo) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		List<RoleVO> authList = roleService.getAuthListByRole(roleNo);
		RoleVO role = roleService.getRoleByNo(roleNo);
		params.put("authList", authList);
		params.put("role", role);
		return params; 
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxRoleList.do", method=RequestMethod.POST)
	public List<RoleVO> ajaxRoleList() throws SQLException {
		return roleService.getRoleList();
	}
	
	@ResponseBody
	@RequestMapping(value="/giveAdminRole.do", method=RequestMethod.POST)
	public void giveAdminRole(@RequestParam("id") String adminId, @RequestParam("no") int roleNo) throws SQLException {
		adminService.modifyAdminRole(adminId, roleNo);
	}
}
