package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.LoginDao;
import com.opensymphony.xwork2.Action;

public class LoginAction implements Action {
	HashMap<String, Object> map;
	
	List<HashMap<String, Object>> memberList;	
	public List<HashMap<String, Object>> getMemberList() {
		return memberList;
	}
	public HashMap<String, Object> getMap() {
		return map;
	}
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public String getEmail() {
		return email;
	}
	public void setMemberList(List<HashMap<String, Object>> memberList) {
		this.memberList = memberList;
	}
	String email;
	public void setEmail(String email) {
		this.email = email;
	}

	
	
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		System.out.println(memberList);
		LoginDao LDao = new LoginDao();
		memberList = new ArrayList<HashMap<String, Object>>();
		memberList = LDao.loginSelect();
		return SUCCESS;
	}

}
