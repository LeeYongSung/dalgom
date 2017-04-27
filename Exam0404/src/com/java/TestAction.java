package com.java;

import java.util.HashMap;
import java.util.List;

import com.java.dao.BoardDao;
import com.opensymphony.xwork2.Action;

public class TestAction implements Action {

	private String text;
	private String title, content;
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getText() {
		return text;
	}
	
	private int no;
	public void setNo(int no) {
		this.no = no;
	}

	private List<HashMap<String, Object>> list;
	private BoardDao Bdao;
	public List<HashMap<String, Object>> getList() {
		return list;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		text = "execute";
		Bdao = new BoardDao();
		list = Bdao.selectBoard();
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		System.out.println("execute2()");
		text = "S";
		Bdao = new BoardDao();
		int flag = Bdao.deleteBoard(no);
		if(flag == 1){
			text = "S";
		}else {
			text = "E";
		}
		return LOGIN;
	}
	
	public String insert() throws Exception {
		System.out.println("execute3()");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		Bdao = new BoardDao();
		int flag = Bdao.insertBoard(map);
		if(flag == 1){
			text = "S";
		}else {
			text = "E";
		}
		return INPUT;
	}
	
	public String update() throws Exception {
		System.out.println("execute4()");
		text = "S";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("title", title);
		map.put("content", content);
		System.out.println(map);
		Bdao = new BoardDao();
		int flag = Bdao.updateBoard(map);
		if(flag == 1){
			text = "S";
		}else {
			text = "E";
		}
		return INPUT;
	}

}
