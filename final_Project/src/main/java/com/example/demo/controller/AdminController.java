package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping("/admin/adminMain")
	@ResponseBody
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/admin/mgr_insertProduct")
	@ResponseBody
	public String mgr_insertProduct() {
		return "관리자-상품등록입니다.";
	}
	
	@RequestMapping("/admin/mgr_listProduct")
	@ResponseBody
	public ModelAndView mgr_listProduct() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.cartProduct());
		return mav;
	}
	
	@RequestMapping("/admin/mgr_detailProduct")
	@ResponseBody
	public String mgr_detailProduct() {
		return "관리자-상품상세입니다.";
	}
	
	@RequestMapping("/admin/mgr_updateProduct")
	@ResponseBody
	public String mgr_updateProduct() {
		return "관리자-상품수정입니다.";
	}
	
	@RequestMapping("/admin/category_sale")
	@ResponseBody
	public String category_sale() {
		return "관리자- 카테고리별판매량입니다.";
	}
	
	@RequestMapping("/admin/updateQna_answer")
	@ResponseBody
	public String updateQna_answer() {
		return "관리자-상품문의답글입니다.";
	}
	
	@RequestMapping("/admin/mgr_listQna")
	@ResponseBody
	public String mgr_listQna() {
		return "관리자-상품문의목록입니다.";
	}
	
	@RequestMapping("/admin/mgr_detailQna")
	@ResponseBody
	public String mgr_detailQna() {
		return "관리자-상품문의상세입니다.";
	}
}
