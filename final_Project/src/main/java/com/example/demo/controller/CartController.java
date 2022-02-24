package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@RequestMapping(value = "/market/insertCart", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request, CartVO c) {
		int re = dao.insertCart(c);
		ModelAndView mav = new ModelAndView("redirect:/cartProduct");
		if (re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "장바구니 등록에 실패하였습니다.");
		}
		return mav;
	}

	@RequestMapping("/market/cartProduct")
	public ModelAndView cartProduct() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.cartProduct());
		return mav;
	}

	@RequestMapping(value = "/market/updateCart", method = RequestMethod.POST)
	public CartVO updateSubmitAjax(CartVO c, HttpServletRequest request) {
		int re = dao.updateCart(c);
		return c;
	}

	@RequestMapping("/market/deleteCart")
	public int deleteAjax(int cart_no, HttpServletRequest request) {
		int re = dao.deleteCart(cart_no);
		return re;
	}

	@RequestMapping(value = "/market/orderPage", method = RequestMethod.POST)
	public ModelAndView CheckOrder(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getAttribute("cpList"));
		ModelAndView mav = new ModelAndView();
		//mav.addObject("orderPage", c);
		return mav;
	}

}
