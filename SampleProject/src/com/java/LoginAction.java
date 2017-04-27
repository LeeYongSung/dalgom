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
	private HashMap<String,Object> userMap, dataMap;
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
	public String getEmail() {
		return email;
	}
	public String getPwd() {
		return pwd;
	}
	private int cnt;
	public int getCnt() {
		return cnt;
	}
	public HashMap<String, Object> getUserMap() {
		return userMap;
	}
	
	@Override
	public String execute() throws Exception {
		LoginDao msDao = new LoginDao();
		userMap = new HashMap<String, Object>();
		dataMap = new HashMap<String, Object>();
		dataMap.put("email", email);
		dataMap.put("pwd", pwd);
		userMap = msDao.selectUser(dataMap);
		System.out.println(userMap);
		if(userMap != null){
			SessionMap.put("email", email);
			SessionMap.put("userNm", userMap.get("USER_NM"));
			result = SUCCESS;
		}else{
			result = LOGIN;
			message = "입력하신 정보가 잘 못 되었습니다.";
		}
		return result;
	}
	public String detailUser() throws Exception {
		LoginDao msDao = new LoginDao();
		userMap = new HashMap<String, Object>();
		userMap = msDao.selectUserDetail(SessionMap.get("email").toString());
		System.out.println(userMap);
		return SUCCESS;
	}
	public String insert() throws Exception {
		LoginDao msDao = new LoginDao();
		userMap = new HashMap<String, Object>();
		dataMap = new HashMap<String, Object>();
		dataMap.put("email", email);
		dataMap.put("pwd", pwd);
		dataMap.put("userNm", email.substring(0, email.indexOf("@")));
		dataMap.put("userDesc", "");
		System.out.println(dataMap);
		cnt = msDao.insertUser(dataMap);
		System.out.println(cnt);
		if(cnt == 1){
			SessionMap.put("email", email);
			SessionMap.put("userNm", email.substring(0, email.indexOf("@")));
		}
		return SUCCESS;
	}
	public String guestLogin() throws Exception {
		SessionMap.put("email", "guest");
		SessionMap.put("userNm", "손님");
		return SUCCESS;
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
