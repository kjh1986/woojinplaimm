package com.woojinplaimm.edu.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woojinplaimm.edu.LoginService;
import com.woojinplaimm.edu.model.Login;


//공통적인 부모주소를 지정한다
@Controller
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private LoginService service;
	
	//세부적인 자식 주소를 지정한다.
	//전체 요청주소는 /member/list
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req) {
		
		String admin_id = req.getParameter("admin_id");
		String admin_pass = req.getParameter("admin_pass");
		Login log = new Login();
		log.setAdmin_id(admin_id);
		log.setAdmin_pass(admin_pass);
		log = service.login(log);
		logger.info("loginId: {}",admin_id);
		req.getSession().setMaxInactiveInterval(3600);
		req.getSession().setAttribute("loginInfo", log);
		//포워딩
		return "main";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest req) {
		
		req.getSession().invalidate();
		//포워딩
		return "home";
	}
	
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	};

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String goMain() {
		return "main";
	};
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String goHome() {
		return "home";
	};
	
}