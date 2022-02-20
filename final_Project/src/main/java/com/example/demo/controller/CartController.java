package com.example.demo.controller;


import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.vo.CartProductVO;
import com.example.demo.vo.CartVO;

import lombok.Setter;

@RestController
@Setter
public class CartController {
	@Autowired
	private CartDAO dao;
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request  , CartVO c) {		
		int re = dao.insertCart(c);
		ModelAndView mav = new ModelAndView("redirect:/CartProduct");
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "장바구니 등록에 실패하였습니다.");
		}
		return mav;
	}
	
	@RequestMapping("/cartProduct")
	public ModelAndView cartProduct() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.cartProduct());
		return mav;
	}	
		
	
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public ModelAndView updateSubmit(CartVO c, HttpServletRequest request) {
		int re =dao.updateCart(c);
		ModelAndView mav = new ModelAndView("redirect:/cartProduct");
		System.out.println("updateCart!");
		if(re != 1) {
			System.out.println("updateCart Error");
			mav.setViewName("error");
			mav.addObject("msg", "장바구니 수정에 실패하였습니다.");
		}
		
		return mav;
	}
	@RequestMapping(value = "/updateCartAjax", method = RequestMethod.POST)
	public CartVO updateSubmitAjax(CartVO c, HttpServletRequest request) {
		int re =dao.updateCart(c);
		
		return c;
	}
	
	@RequestMapping("/deleteCart")
	public ModelAndView delete(HttpServletRequest request, int cart_no) {
		int re = dao.deleteCart(cart_no);
		ModelAndView mav = new ModelAndView("redirect:/cartProduct");
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "장바구니 삭제에 실패하였습니다.");
		}		
		return mav;
	}
}
