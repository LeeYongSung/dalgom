package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dao.BoardDao;
import com.opensymphony.xwork2.Action;

public class BoardAction implements Action {
	HashMap<String, Object> map;
	
	List<HashMap<String, Object>> Board;

	int No;
	String Title, Content, ModDate;
	
	public List<HashMap<String, Object>> getBoard() {
		return Board;
	}
	public void setNo(int no) {
		No = no;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public void setContent(String content) {
		Content = content;
	}
	public void setModDate(String modDate) {
		ModDate = modDate;
	}


	
	
	@Override
	public String execute() throws Exception {
		BoardDao BDao = new BoardDao();
		Board = new ArrayList<HashMap<String, Object>>();
		Board = BDao.boardSelect();
		return SUCCESS;
	}

}
