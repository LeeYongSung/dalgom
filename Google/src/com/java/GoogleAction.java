package com.java;

import java.util.HashMap;

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
	
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		Bdao = new GoogleDao();
		cnt = Bdao.insertBoard(getMap());
		System.out.println("execute() : " + cnt);
		return SUCCESS;
	}
}
