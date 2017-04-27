package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.MySqlDao;
import com.opensymphony.xwork2.Action;

public class MySqlAction implements Action {

	private List<HashMap<String,Object>> list;
	public List<HashMap<String, Object>> getList() {
		return list;
	}

	@Override
	public String execute() throws Exception {
		MySqlDao msDao = new MySqlDao();
		list = new ArrayList<HashMap<String, Object>>();
		list = msDao.selectTable();
		return SUCCESS;
	}

}
