package com.sc.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String loginStatus = (String)session.getAttribute("loginStatus");
		
		if(loginStatus==null || !loginStatus.equals("A")) {
			response.sendRedirect(request.getContextPath());
		}
		return true;
	}
}



