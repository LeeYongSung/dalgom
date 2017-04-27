package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.AdminDao;
import com.java.dao.MenuDao;
import com.opensymphony.xwork2.Action;

public class MenuAction implements Action {
	
	List<HashMap<String, Object>> userList, mappingList;
	public List<HashMap<String, Object>> getUserList() {
		return userList;
	}
	public List<HashMap<String, Object>> getMappingList() {
		return mappingList;
	}
	String userId;
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String execute() throws Exception {
		MenuDao mDao = new MenuDao();
		mappingList = new ArrayList<HashMap<String, Object>>();
		mappingList = mDao.selectMenu(userId);
		AdminDao aDao = new AdminDao();
		userList = new ArrayList<HashMap<String, Object>>();
		userList = aDao.selectUsers();
		return SUCCESS;
	}
}
