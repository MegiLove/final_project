//package com.example.demo.controller;
//
//import java.io.FileOutputStream;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.example.demo.dao.Customer_orderDAO;
//import com.example.demo.vo.CartVO;
//
//import lombok.Setter;
//
//@RestController
//@Setter
//public class Customer_orderController {
//	
//	@Autowired
//	private Customer_orderDAO dao;
//
//	@RequestMapping(value = "/market/orderPage")
//	public ModelAndView orderPage() {
//		ModelAndView mav = new ModelAndView();
//		return mav;
//	}
//}
