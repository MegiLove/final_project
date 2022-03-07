package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerOrder_detailDAO;
import com.example.demo.vo.CustomerOrder_detailVO;

import lombok.Setter;

@RestController
@Setter
public class CustomerOrder_detailController {
	
	private CustomerOrder_detailDAO dao;
	

}
