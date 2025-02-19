package com.sc.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String loginStatus = (String)session.getAttribute("loginStatus");
		
		if(loginStatus==null || !loginStatus.equals("Y")) {
			response.sendRedirect(request.getContextPath()+"/user/login");
		}
		
		return true;
	}
}
