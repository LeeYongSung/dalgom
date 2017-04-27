package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;

public class ResultAction implements Action {

	List<HashMap<String, Object>> list;
	
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		list = new ArrayList<HashMap<String, Object>>();
		
		ResultDAO rDao = new ResultDAO();
		rDao.selectTemp();
		System.out.println(list.size());
		
		return SUCCESS;
	}
	
	public String lys() throws Exception {
		System.out.println("lys()");
		return SUCCESS;
	}

}
