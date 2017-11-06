package com.woojinplaimm.edu;


import com.woojinplaimm.edu.model.Login;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface LoginDAO {
	public Login login(Login log);
}
