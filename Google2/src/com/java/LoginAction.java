package com.java;

import java.util.HashMap;

import com.java.dao.AdminDao;
import com.opensymphony.xwork2.Action;

public class LoginAction implements Action {
	String email;
	public void setEmail(String email) {
		this.email = email;
	}
	HashMap<String, Object> map;
	public HashMap<String, Object> getMap() {
		return map;
	}

	@Override
	public String execute() throws Exception {
		map = new HashMap<String, Object>();
		AdminDao Adao = new AdminDao();
		map = Adao.login(email);
		return SUCCESS;
	}

}
