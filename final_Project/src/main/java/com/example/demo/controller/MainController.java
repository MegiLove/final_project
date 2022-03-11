package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.ProductDAO;
import com.example.demo.vo.MarginProductVO;
import com.example.demo.vo.ProductVO;

import lombok.Setter;

@Controller
@Setter
public class MainController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping("/main")
	public void main(Model model) {
		model.addAttribute("bList", dao.bestProduct());
		List<MarginProductVO> mList = dao.marginProduct();
		for(MarginProductVO m : mList) {
			int mp = (int)(m.getProduct_price()*0.9);
			m.setProduct_mprice(mp);
		}
		model.addAttribute("mList", mList);
		//System.out.println("할인상품:"+mList);
	}
}
