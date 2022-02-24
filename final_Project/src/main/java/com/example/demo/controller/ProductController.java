package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ProductDAO;
import com.example.demo.vo.ProductVO;
import com.example.demo.vo.ResultVO;

import lombok.Setter;

@Controller
@Setter
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	
	@RequestMapping("/market/listProduct")
	public void listProduct(String category_code,Model model,HttpSession session,@RequestParam(defaultValue = "1") int pageNUM){
		if(category_code == null) {
			category_code = (String)session.getAttribute("category_code");
		}
		
//		System.out.println("정렬컬럼:"+orderColumn);
		System.out.println("pageNUM:"+pageNUM);
		
		int start = (pageNUM-1)*dao.pageSIZE +1;
		int end = start + dao.pageSIZE -1;
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		
		
		HashMap map = new HashMap();
		//map.put("orderColumn", orderColumn);
		map.put("category_code", category_code);
		map.put("start", start);
		map.put("end",end);
		System.out.println("category_code:"+category_code);
		
		/*
		 * ResultVO r = new ResultVO(); r.setList(dao.listProduct(map));
		 * r.setTotalPage(dao.totalPage);
		 * System.out.println("totalPage:"+dao.totalPage);
		 * 
		 * return r;
		 */
		
		//model.addAttribute("list", dao.listProduct(category_code));
		model.addAttribute("list", dao.listProduct(map));
		model.addAttribute("totalPage", dao.totalPage);
		
		if(category_code != null) {
			session.setAttribute("category_code", category_code);
		}
		
		
//		if(orderColumn != null) {
//			session.setAttribute("orderColumn", orderColumn);
//		}
	}
}
