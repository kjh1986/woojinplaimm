package com.woojinplaimm.edu;

import com.woojinplaimm.edu.model.Login;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface LoginService {

	public Login login(Login log);
	
	public void logout();

}
