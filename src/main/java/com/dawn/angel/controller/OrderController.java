package com.dawn.angel.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dawn.angel.domain.CartVO;
import com.dawn.angel.domain.MemberVO;
import com.dawn.angel.domain.OrderVO;
import com.dawn.angel.domain.ProductVO;
import com.dawn.angel.domain.WishVO;
import com.dawn.angel.service.CartService;
import com.dawn.angel.service.MemberService;
import com.dawn.angel.service.OrderService;
import com.dawn.angel.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService prodService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(Model model, HttpSession session) throws SQLException {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		List<CartVO> cartList = null;
		List<WishVO> wishList = null;
		
		if(loginUser == null) {
			cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			wishList = (ArrayList<WishVO>) session.getAttribute("wishList");
		} else {
			cartList = cartService.getCartListById(loginUser.getId());
			wishList = cartService.getWishListById(loginUser.getId());
		}
		
		if(cartList != null) {
			int totalPrice = 0;
			int totalSave = 0;
			for(CartVO cart : cartList) {
				totalPrice += cart.getProdPrice2() * cart.getQuantity();
				totalSave += cart.getProdSave() * cart.getQuantity();
			}
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("totalSave", totalSave);
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("wishList", wishList);
		
		return "order/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(CartVO cart, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
	
		if(member == null) {
			List<CartVO> cartList = null;
			
			ProductVO product = prodService.getProductByNo(cart.getProdNo());
			cart.setProdNo(product.getProdNo());
			cart.setProdName(product.getName());
			cart.setProdPrice1(product.getPrice1());
			cart.setProdPrice2(product.getPrice2());
			cart.setProdSave(product.getSave());
			cart.setProdImage(product.getImage());
			
			if(session.getAttribute("cartList") == null) {
				cartList = new ArrayList<CartVO>();
				cart.setCartNo(cartList.size()+1);
				cartList.add(cart);
			} else {
				cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
				cart.setCartNo(cartList.size()+1);
				cartList.add(cart);
			}
			session.setAttribute("cartList", cartList);
		} else {
			cartService.addCart(cart);
		}
		
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="/wish.do", method=RequestMethod.POST)
	public String cart(WishVO wish, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			List<WishVO> wishList = null;
			
			ProductVO product = prodService.getProductByNo(wish.getProdNo());
			wish.setProdNo(product.getProdNo());
			wish.setProdName(product.getName());
			wish.setProdPrice1(product.getPrice1());
			wish.setProdPrice2(product.getPrice2());
			wish.setProdSave(product.getSave());
			wish.setProdImage(product.getImage());
			
			if(session.getAttribute("wishList") == null) {
				wishList = new ArrayList<WishVO>();
				wish.setWishNo(wishList.size()+1);
				wishList.add(wish);
			} else {
				wishList = (ArrayList<WishVO>) session.getAttribute("wishList");
				wish.setWishNo(wishList.size()+1);
				wishList.add(wish);
			}
			session.setAttribute("wishList", wishList);
		} else {
			cartService.addWish(wish);
		}
		
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="/order.do", method=RequestMethod.GET)
	public String order(Model model, HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<CartVO> cartList = null;
		if(member == null) {
			cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			model.addAttribute("loginyn", "n");
		} else {
			cartList = cartService.getCartListById(member.getId());
			MemberVO user = memberService.getMemberById(member.getId());
			model.addAttribute("user", user);
			model.addAttribute("loginyn", "y");
		}
		int totalPrice = 0;
		if(cartList != null) {
			for(CartVO cart : cartList) {
				totalPrice += cart.getProdPrice2() * cart.getQuantity();
			}
			model.addAttribute("cartList", cartList);
		}
		
		model.addAttribute("totalPrice", totalPrice);
		
		return "order/order";
	}
	
	@RequestMapping(value="/updateAmount.do", method=RequestMethod.GET)
	public String updateAmount(CartVO cart, HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			List<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			for(CartVO cartVO : cartList) {
				if(cartVO.getCartNo() == cart.getCartNo()) {
					cartVO.setQuantity(cart.getQuantity());
					session.setAttribute("cartList", cartList);
					break;
				}
			}
		} else {
			cartService.modifyQuantity(cart);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="removeCart.do", method=RequestMethod.GET)
	public String removeCart(@RequestParam("delList") List<Integer> delList, HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			List<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			for(int delNo : delList) {
				for(CartVO cart : cartList) {
					if(cart.getCartNo() == delNo) {
						cartList.remove(cart);
						break;
					}
				}
			}
			session.setAttribute("cartList", cartList);
		} else {
			cartService.removeCartList(delList);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="removeCartAll.do", method=RequestMethod.GET)
	public String removeCartAll(String id, HttpSession session) throws SQLException{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			session.removeAttribute("cartList");
		} else {
			cartService.removeCartAll(id);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="addCartFromWish.do", method=RequestMethod.GET)
	public String addCartFromWish(@RequestParam("wishNo") int wishNo, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		if(member == null) {
			List<WishVO> wishList = (ArrayList<WishVO>) session.getAttribute("wishList");
			List<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			
			for(WishVO wishVO : wishList) {
				if(wishVO.getWishNo() == wishNo) {
					CartVO cart = new CartVO();
					cart.setCartNo(cartList.size() + 1);
					cart.setProdNo(wishVO.getProdNo());
					cart.setProdName(wishVO.getProdName());
					cart.setProdPrice1(wishVO.getProdPrice1());
					cart.setProdPrice2(wishVO.getProdPrice2());
					cart.setProdSave(wishVO.getProdSave());
					cart.setProdImage(wishVO.getProdImage());
					cart.setQuantity(wishVO.getQuantity());
					
					cartList.add(cart);
					wishList.remove(wishVO);
					session.setAttribute("wishList", wishList);
					session.setAttribute("cartList", cartList);
					break;
				}
			}
		} else {
			WishVO wish = cartService.getWishByNo(wishNo);
			cartService.addCartFromWish(wish);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="removeWish.do", method=RequestMethod.GET)
	public String removeWish(@RequestParam("wishNo") int wishNo, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			List<WishVO> wishList = (ArrayList<WishVO>) session.getAttribute("wishList");
			for(WishVO wish : wishList) {
				if(wish.getWishNo() == wishNo) {
					wishList.remove(wish);
					session.setAttribute("wishList", wishList);
					break;
				}
			}
		} else {
			cartService.removeWish(wishNo);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="removeOrderCart.do", method=RequestMethod.GET)
	public String removeOrderCart(@RequestParam("cartNo") int cartNo, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member == null) {
			List<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			for(CartVO cart : cartList) {
				if(cart.getCartNo() == cartNo) {
					cartList.remove(cart);
					break;
				}
			}
			session.setAttribute("cartList", cartList);
		} else {
			cartService.removeCart(cartNo);
		}
		return "redirect:order.do";
	}
	
	@RequestMapping(value="directOrder.do", method=RequestMethod.POST)
	public String directOrder(CartVO cart, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String url = "redirect:order.do";
		
		if(member == null) {
			List<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			if (cartList == null) {
				cartList = new ArrayList<CartVO>();
			} else {
				url = "redirect:/product/detail.do?no=" + cart.getProdNo() + "&direct=y";
			}
			ProductVO prod = prodService.getProductByNo(cart.getProdNo());
			cart.setCartNo(cartList.size() + 1);
			cart.setProdNo(prod.getProdNo());
			cart.setProdName(prod.getName());
			cart.setProdPrice1(prod.getPrice1());
			cart.setProdPrice2(prod.getPrice2());
			cart.setProdSave(prod.getSave());
			cart.setProdImage(prod.getImage());
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
		} else {
			cartService.addCart(cart);
			List<CartVO> cartList = cartService.getCartListById(cart.getMemId());
			if(cartList.size() != 1) {
				url = "redirect:/product/detail.do?no=" + cart.getProdNo() + "&direct=y";
			}
		}
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxGetSave.do", method=RequestMethod.POST)
	public int ajaxGetSave(String id) throws SQLException {
		MemberVO member = memberService.getMemberById(id);
		return member.getSave();
	}
	
	@RequestMapping(value="complete.do", method=RequestMethod.GET)
	public String complete(@RequestParam("no") int orderNo, Model model, HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<OrderVO> orderList = null;
		OrderVO order = null;
		if(member == null) {
			orderList = orderService.getOrderDetailListForGuest(orderNo);
			order = orderService.getOrderByNoForGuest(orderNo);
		} else {
			orderList = orderService.getOrderDetailList(orderNo);
			order = orderService.getOrderByNo(orderNo);
		}
		
		int totalPrice = 0;
		int totalSave = 0;
		for(OrderVO o : orderList) {
			totalPrice += o.getProdPrice2() * o.getQuantity();
			totalSave += o.getProdSave() * o.getQuantity();
		}
		model.addAttribute("totalSave", totalSave);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("order", order);
		model.addAttribute("orderList", orderList);
		
		return "order/order_complete";
	}
	
	@RequestMapping(value="complete.do", method=RequestMethod.POST)
	public String complete(OrderVO order, String hope_date, HttpSession session, RedirectAttributes rttr) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		if(hope_date != "") {
			Timestamp hopeDate = Timestamp.valueOf(hope_date + " 00:00:00");
			order.setHopeDate(hopeDate);
		}
		if(member == null) {
			List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");
			orderService.insertOrderForGuest(order, cartList);
			session.removeAttribute("cartList");
			MemberVO guest = new MemberVO();
			guest.setName(order.getMemName());
			guest.setEmail(order.getMemEmail());
			guest.setPhone(order.getMemPhone());
			rttr.addFlashAttribute("guest", guest);
		} else {
			order.setMemId(member.getId());
			orderService.insertOrder(order);
		}
		int orderNo = orderService.getMaxOrderNo();
		
		return "redirect:complete.do?no=" + orderNo;
	}
}