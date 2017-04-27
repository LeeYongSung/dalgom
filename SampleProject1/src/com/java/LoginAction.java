package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.java.dao.LoginDao;
import com.opensymphony.xwork2.Action;

public class LoginAction implements Action, SessionAware {

	private Map<String, Object> SessionMap;
	private HashMap<String,Object> userMap;
	
	private String email, pwd, userNm, userDesc, result, remember, message;
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}
	public void setRemember(String remember){
		this.remember = remember;
	}
	public String getMessage(){
		return message;
	}
	
	@Override
	public String execute() throws Exception {
		LoginDao msDao = new LoginDao();
		userMap = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pwd", pwd);
		map.put("userNm", email.substring(0, email.indexOf("@")));
		map.put("userDesc", userDesc);
		userMap = msDao.selectUser(map);
		System.out.println(userMap);
		if(userMap != null){
			SessionMap.put("email", email);
			SessionMap.put("userNm", userMap.get("USER_NM"));
			result = SUCCESS;
		}else{
			result = LOGIN;
			SessionMap.put("email", email);
			SessionMap.put("pwd", pwd);
			message = "입력하신 정보가 잘 못 되었습니다.";
		}
		return result;
	}
	public String guestLogin() throws Exception {
		SessionMap.put("email", "guest");
		SessionMap.put("userNm", "손님");
		return SUCCESS;
	}
	public String insertUser() throws Exception {
		System.out.println("insertUser()");
		LoginDao msDao = new LoginDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pwd", pwd);
		map.put("userNm", email.substring(0, email.indexOf("@")));
		map.put("userDesc", userDesc);
		map.put("regid", email);
		map.put("modid", email);
		System.out.println(map);
		int flag = msDao.insertUser(map);
		if(flag == 1) {
			SessionMap.put("email", email);
			SessionMap.put("userNm", userMap.get("USER_NM"));
			result = SUCCESS;
		} else {
			result = LOGIN;
		}
		return result;
	}
	public String logout() throws Exception {
		SessionMap.remove("email");
		return SUCCESS;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		SessionMap = new HashMap<String, Object>();
		SessionMap = session;
	}

}
