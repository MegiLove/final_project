package com.example.demo.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.CustomerOrder_detailDAO;
import com.example.demo.dao.Customer_orderDAO;
import com.example.demo.dao.ReviewDAO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.CustomerOrder_detailVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.Customer_orderVO;
import com.example.demo.vo.ListDetailVO;
import com.example.demo.vo.OrderCommitVO;
import com.example.demo.vo.ReviewVO;
import com.google.gson.Gson;


import lombok.Setter;

@Controller
@Setter
public class Customer_orderController {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private CustomerDAO custDAO;
	
	@Autowired
	private Customer_orderDAO dao;
	
	@Autowired
	private CustomerOrder_detailDAO codDAO;
	
	@Autowired
	private ReviewDAO reDAO;
	
	@Autowired
	private CartDAO cartDAO;
	

	@RequestMapping("/mypage/orderList")
	public void list(HttpSession session, Model model) {
		CustomerVO member = (CustomerVO)session.getAttribute("member");
		model.addAttribute("list",dao.listOrder(member.getCust_id()));
	}
	
	@RequestMapping("/mypage/orderDetail")
	public void detail(Model model,int order_no) {
		List<ListDetailVO> list = codDAO.listDetail(order_no);
//		System.out.println("주문상세내역:"+list);
		model.addAttribute("list",list);
		model.addAttribute("o",list.get(0));
		
		model.addAttribute("totalDetail",codDAO.totalDetail(order_no));
		ListDetailVO ld = new ListDetailVO();
	}

	@RequestMapping(value = "/market/orderRequest", method = RequestMethod.POST)
	@ResponseBody
	public void insertCustomer_order(HttpServletRequest request, HttpServletResponse response) {
		Gson gson = new Gson();
		
		
		
		System.out.println("오더리스트 출력:"+request.getAttribute("orderList"));
		System.out.println("오더리스트 출력:"+request.getParameter("orderList"));
		String data = request.getParameter("orderList");
		data = data.replace("},{","}, {");
		int length = data.length();
		String[] orderList = data.substring(1, length-1).split(", ");
		int order_no = dao.order_getNextNo();
		String cust_email="";
		String cust_id="";
		boolean skip = false;
		for(String order : orderList) {
			OrderCommitVO ocm= gson.fromJson(order, OrderCommitVO.class);
			
			ReviewVO r = gson.fromJson(order, ReviewVO.class);
			CustomerOrder_detailVO cd = gson.fromJson(order, CustomerOrder_detailVO.class);
			CartVO cart= gson.fromJson(order, CartVO.class);
			if(!skip) {
				Customer_orderVO co = gson.fromJson(order, Customer_orderVO.class);
				co.setOrder_no(order_no);
				dao.insertCustomer_order(co);
				skip=true;
				cust_email = custDAO.getEmail(co.getCust_id());
				cust_id=co.getCust_id();
				System.out.println("B"+co);
			};

			cd.setDetail_no(codDAO.orderdetail_getNextNo());
			cd.setOrder_no(order_no);
			cd.setDetail_cnt(ocm.getProduct_cnt());
			cd.setDetail_price(ocm.getProduct_cnt()*ocm.getProduct_price());
			
			r.setReview_no(reDAO.review_getNextNo());
			r.setDetail_no(codDAO.orderdetail_getNextNo());
			
//			cve.setCust_id(ocm.getCust_id());
			System.out.println("A"+order);
			System.out.println("C"+r);
			System.out.println("D"+cd);
			System.out.println("E"+cart);
			codDAO.insertCustomerOrder_detail(cd);
			reDAO.defaultReview(r);
			cartDAO.deleteCart(cart.getCart_no());	
			
		}
		String subject = cust_id+"님, 주문이 완료되었습니다";
		String content = "주문번호: "+order_no;
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject(subject);
		mailMessage.setText(content);
		mailMessage.setFrom("shb04437@gmail.com");
		mailMessage.setTo(cust_email);
		
		try {
			javaMailSender.send(mailMessage);
			System.out.println(cust_email+"에게 메일을 발송하였습니다.");
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}


		
//		int length = request.getParameter("orderList").length();
//		String[] orderList = request.getParameter("orderList").substring(1, length-1).split(", ");
//		for(String order : orderList) {
//			System.out.println("오더붕어 :"+order);
//		}
//		OrderCommitVO ocm= gson.fromJson(request.getParameter("orderList"), OrderCommitVO.class);
//		Customer_orderVO cve =new Customer_orderVO();
//		cve.setCust_id(ocm.getCust_id());
//		
//		ModelAndView mav = new ModelAndView();
//		return mav;
	}

	

	
}
