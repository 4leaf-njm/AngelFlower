package com.dawn.angel.controller.admin;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
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

import com.dawn.angel.domain.AccountVO;
import com.dawn.angel.domain.AdminVO;
import com.dawn.angel.domain.BannerVO;
import com.dawn.angel.domain.Criteria;
import com.dawn.angel.domain.NoticeVO;
import com.dawn.angel.domain.PageMaker;
import com.dawn.angel.service.NoticeService;
import com.dawn.angel.service.StoreService;
import com.dawn.angel.util.AuthUtil;

@Controller
@RequestMapping("/admin/store")
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AuthUtil authUtil;
	
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String notice(@ModelAttribute("m") String m, @ModelAttribute("s") String s, @ModelAttribute("cri") Criteria cri,
			             Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/store/notice";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_STORE_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			cri.setPerPageNum(10);
			List<NoticeVO> noticeList = noticeService.getNoticeListCri(cri);
			if(noticeList.size() == 0) {
				cri.setPage(cri.getPage() - 1);
				noticeList = noticeService.getNoticeListCri(cri);
			}
			PageMaker pageMaker = new PageMaker();
			pageMaker.setDisplayPageNum(5);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticeService.getNoticeListCount());
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("pageMaker", pageMaker);
		}
		return url;
	}
	
	@RequestMapping(value="/insertNotice.do", method=RequestMethod.POST)
	public String insertNotice(String m, Criteria cri, NoticeVO notice, RedirectAttributes rttr) throws SQLException {
		noticeService.insertNotice(notice);
		rttr.addFlashAttribute("msg", "공지 등록이 완료되었습니다.");
		return "redirect:notice.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/modifyNotice.do", method=RequestMethod.POST)
	public String modifyNotice(String m, Criteria cri, NoticeVO notice, RedirectAttributes rttr) throws SQLException {
		noticeService.modifyNotice(notice);
		rttr.addFlashAttribute("msg", "공지 수정이 완료되었습니다.");
		return "redirect:notice.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value="/removeNotice.do", method=RequestMethod.GET)
	public String removeNotice(String m, Criteria cri, @RequestParam("no") int noticeNo, RedirectAttributes rttr) throws SQLException {
		noticeService.removeNotice(noticeNo);
		rttr.addFlashAttribute("msg", "공지 삭제가 완료되었습니다.");
		return "redirect:notice.do?m=" + m + "&page=" + cri.getPage();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxNotice.do", method=RequestMethod.POST)
	public NoticeVO ajaxNotice(@RequestParam("no") int noticeNo) throws SQLException {
		return noticeService.getNoticeByNo(noticeNo);
	}
	
	@RequestMapping(value="/account.do", method=RequestMethod.GET)
	public String account(@ModelAttribute("m") String m, @ModelAttribute("s") String s, Model model,
			              HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/store/account";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_STORE_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			List<AccountVO> accountList = storeService.getAccountList();
			model.addAttribute("accountList", accountList);
		}
		return url;
	}
	
	@RequestMapping(value="/insertAccount.do", method=RequestMethod.POST)
	public String insertAccount(String m, String s, AccountVO account, RedirectAttributes rttr) throws SQLException {
		storeService.insertAccount(account);
		rttr.addFlashAttribute("msg", "계좌 등록이 완료되었습니다.");
		return "redirect:account.do?m=" + m + "&s=" + s;
	}
	
	@RequestMapping(value="/modifyAccount.do", method=RequestMethod.POST)
	public String modifyAccount(String m, String s, AccountVO account, RedirectAttributes rttr) throws SQLException {
		storeService.modifyAccount(account);
		rttr.addFlashAttribute("msg", "계좌 수정이 완료되었습니다.");
		return "redirect:account.do?m=" + m + "&s=" + s;
	}
	
	@RequestMapping(value="/removeAccount.do", method=RequestMethod.GET)
	public String removeAccount(String m, String s, @RequestParam("no") int accNo, RedirectAttributes rttr) throws SQLException {
		storeService.removeAccount(accNo);
		rttr.addFlashAttribute("msg", "계좌 삭제가 완료되었습니다.");
		return "redirect:account.do?m=" + m + "&s=" + s;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAccount.do", method=RequestMethod.POST)
	public AccountVO ajaxAccount(@RequestParam("no") int accNo) throws SQLException {
		return storeService.getAccountByNo(accNo);
	}
	
	@RequestMapping(value="/banner.do", method=RequestMethod.GET)
	public String banner(@ModelAttribute("m") String m, @ModelAttribute("s") String s, Model model,
			             HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "admin/store/banner";
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		if(!authUtil.hasRole(loginUser.getId(), "RIGHT_STORE_VIEW")) {
			url = "redirect:/admin/home.do";
			rttr.addFlashAttribute("msg", "권한이 없습니다.");
		} else {
			List<BannerVO> bannerList = storeService.getBannerList();
			model.addAttribute("bannerList", bannerList);
		}
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxBanner.do", method=RequestMethod.POST)
	public BannerVO ajaxBanner(@RequestParam("no") int bannerNo) throws SQLException {
		return storeService.getBannerByNo(bannerNo);
	}
	
	@RequestMapping(value="/modifyBanner.do", method=RequestMethod.POST)
	public String modifyBanner(String m, String s, BannerVO banner, @RequestParam("mfile") MultipartFile mfile, 
			                   HttpSession session, RedirectAttributes rttr) throws Exception {
		String savePath = "/resources/upload/banner";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(!mfile.isEmpty()) {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			banner.setBannerImage(fileName);
		}
		rttr.addFlashAttribute("msg", "정상적으로 변경되었습니다.");
		storeService.modifyBanner(banner);
		return "redirect:banner.do?m=" + m + "&s=" + s;
	}
}
