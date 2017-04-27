package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.GoogleDao;
import com.opensymphony.xwork2.Action;

public class DevAction implements Action {

	private List<HashMap<String, Object>> list, list2, list3, list4;
	HashMap<String, Object> map;
	

	private GoogleDao Gdao;
	private String text;
	private String userId, authId;
	
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setAuthId(String authId) {
		this.authId = authId;
	}
	public String getText() {
		return text;
	}
	public List<HashMap<String, Object>> getList() {
		return list;
	}
	public List<HashMap<String, Object>> getList2() {
		return list2;
	}
	public List<HashMap<String, Object>> getList3() {
		return list3;
	}
	public List<HashMap<String, Object>> getList4() {
		return list4;
	}
	public HashMap<String, Object> getMap() {
		return map;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		text = "S";
		list = new ArrayList<HashMap<String, Object>>();
		list2 = new ArrayList<HashMap<String, Object>>();
		Gdao = new GoogleDao();
		list = Gdao.selectName();
		list2 = Gdao.selectAuth();
		System.out.println(list);
		System.out.println(list2);
		return SUCCESS;
	}
	
	public String mapping() throws Exception {
		System.out.println("mapping()");
		Gdao = new GoogleDao();
		list3 = new ArrayList<HashMap<String, Object>>();
		list3 = Gdao.selectMapping(userId); 
		System.out.println(list3);
		return SUCCESS;
	}
	
	public String insert() throws Exception {
		System.out.println("insert()");
		map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("authId", authId);
		Gdao = new GoogleDao();
		Gdao.insertAuth(map);
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		System.out.println("delete()");
		Gdao = new GoogleDao();
		map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("authId", authId);
		Gdao.delete(map);
		list4 = Gdao.selectMapping(userId);
		return SUCCESS;
	}
	
	


}
