package com.java.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.java.dao.LJHDao;
import com.opensymphony.xwork2.Action;

public class LoginAction implements Action, SessionAware {
	Map<String, Object> sessionMap;
	HashMap<String, Object> list;
	public HashMap<String, Object> getList() {
		return list;
	}

	HashMap<String, Object> map;
	public HashMap<String, Object> getMap() {
		map = new HashMap<>();
		map.put("MemEmail", MemEmail);
		map.put("MemPw", MemPw);
		return map;
	}
	
	String MemEmail, MemPw;
	public void setMemEmail(String memEmail) {
		MemEmail = memEmail;
	}
	public void setMemPw(String memPw) {
		MemPw = memPw;
	}
	public String getMemEmail() {
		return MemEmail;
	}
	public String getMemPw() {
		return MemPw;
	}
	
	int size;
	public int getSize() {
		return size;
	}
	
	@Override
	public String execute() throws Exception {
		LJHDao dao = new LJHDao();
		list = dao.selectMember(getMap());
		size = list.size();
		System.out.println(list);
		if(size > 0){
			sessionMap.put("MemEmail", list.get("MEMEMAIL"));
			sessionMap.put("MemName", list.get("MEMNAME"));
		}
		System.out.println(sessionMap.size());
		return SUCCESS;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.sessionMap = session;
	}
	
}
