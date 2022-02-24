package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(); 
		String role = (String)session.getAttribute("role");
		if(role != null && role.equals("admin")) { 
			return super.preHandle(request, response, handler); 
		}else {	
			response.sendRedirect("/login"); 
			return false;	
		}	
	}
}
