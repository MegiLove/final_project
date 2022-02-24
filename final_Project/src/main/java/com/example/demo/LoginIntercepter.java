package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.demo.vo.CustomerVO;
@Component
public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인했는지 파악하기 위헤 request객체를 통해 세션을 가지고와서 세션에 cust_id가 있는지 파악한다
		HttpSession session = request.getSession();
		CustomerVO member = (CustomerVO)session.getAttribute("member");
		if(member != null) { //만약 로그인 하였다면
			return super.preHandle(request, response, handler);//요청한 서비스로
		}else {//로그인 못했으면
			response.sendRedirect("/login");
			return false;
		}
	}

}
