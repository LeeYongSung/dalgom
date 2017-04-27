package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.GoogleDao;
import com.opensymphony.xwork2.Action;

public class GoogleAction implements Action {
	private GoogleDao Bdao;
	private HashMap<String, Object> map;
	public HashMap<String, Object> getMap() {
		map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("img", img);
		map.put("email", email);
		map.put("name", name);
		return map;
	}
	String id, img, email, name;
	public void setId(String id) {
		this.id = id;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setName(String name) {
		this.name = name;
	}
	int cnt;
	public int getCnt() {
		return cnt;
	}
	private List<HashMap<String, Object>> authMap;
	private List<HashMap<String, Object>> userMap;
	public List<HashMap<String, Object>> getAuthMap() {
		return authMap;
	}
	public List<HashMap<String, Object>> getUserMap() {
		return userMap;
	}
	private List<HashMap<String, Object>> mappingList;
	public List<HashMap<String, Object>> getMappingList() {
		return mappingList;
	}
	private HashMap<String, Object> mappingMap;
	public HashMap<String, Object> getMappingMap() {
		mappingMap = new HashMap<String, Object>();
		mappingMap.put("authId", authId);
		mappingMap.put("userId", userId);
		return mappingMap;
	}
	String authId, userId;
	public void setAuthId(String authId) {
		this.authId = authId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		Bdao = new GoogleDao();
		HashMap<String, Object> val = new HashMap<String, Object>();
		System.out.println(getMap());
		val = Bdao.selectUser(getMap());
		System.out.println(val);
		if(val != null){
			cnt = 0;
		}else {
			cnt = Bdao.insertBoard(getMap());
		}
		System.out.println("execute() : " + cnt);
		return SUCCESS;
	}
	
	public String admin() throws Exception {
		authMap = new ArrayList<HashMap<String, Object>>();
		userMap = new ArrayList<HashMap<String, Object>>();
		Bdao = new GoogleDao();
		authMap = Bdao.AuthList();
		userMap = Bdao.UserList();
		return SUCCESS;
	}
	
	public String mapping() throws Exception {
		mappingList = new ArrayList<HashMap<String, Object>>();
		Bdao = new GoogleDao();
		System.out.println(userId);
		mappingList = Bdao.MappingList(userId);
		
//		authMap = new ArrayList<HashMap<String, Object>>();
//		userMap = new ArrayList<HashMap<String, Object>>();
//		authMap = Bdao.AuthList();
//		userMap = Bdao.UserList();
		return SUCCESS;
	}
	
	public String insertMapping() throws Exception {
		mappingList = new ArrayList<HashMap<String, Object>>();
		Bdao = new GoogleDao();
		cnt = Bdao.insertMapping(getMappingMap());
		System.out.println("insertMapping() : " + cnt);
		mappingList = Bdao.MappingList(userId);
		
//		authMap = new ArrayList<HashMap<String, Object>>();
//		userMap = new ArrayList<HashMap<String, Object>>();
//		authMap = Bdao.AuthList();
//		userMap = Bdao.UserList();
		return SUCCESS;
	}
}
