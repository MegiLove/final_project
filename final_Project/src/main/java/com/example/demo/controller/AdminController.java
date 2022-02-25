package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
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
