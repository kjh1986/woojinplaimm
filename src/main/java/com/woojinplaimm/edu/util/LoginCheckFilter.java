package com.woojinplaimm.edu.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest sreq, ServletResponse sres, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) sreq;
		HttpSession session = request.getSession();
		
		String command = request.getRequestURI();
		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		command = command.substring(1);
		
		Object loginInfo = session.getAttribute("loginInfo");
		
		if(loginInfo != null || command.startsWith("log") ||command.equals("")) {
			chain.doFilter(sreq, sres);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/loginfail.jsp");
			dispatcher.forward(sreq, sres);
		}
		
	}
	
	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
