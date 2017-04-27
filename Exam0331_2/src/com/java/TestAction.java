package com.java;

import java.util.HashMap;
import java.util.List;

import com.java.dao.BoardDao;
import com.opensymphony.xwork2.Action;

public class TestAction implements Action {
	
	private String text;
	private int no;
	private String title;
	private String content;
	HashMap<String, Object> map;
	
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getText() {
		return text;
	}
	
	private List<HashMap<String, Object>> list;
	private BoardDao Bdao;
	public List<HashMap<String, Object>> getList() {
		return list;
	}
	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		text = "S";
		Bdao = new BoardDao();
		list = Bdao.selectBoard();
		return SUCCESS;
	}
	public String execute2() throws Exception {
		System.out.println("execute2()");
		System.out.println(no);
		text = "S";
		Bdao = new BoardDao();
		int flag = Bdao.deleteBoard(no);
		System.out.println(flag);
		return LOGIN;
	}
	public String execute3() throws Exception {
		System.out.println("execute3()");
		System.out.println(no);
		System.out.println(title);
		System.out.println(content);
		text = "S";
		Bdao = new BoardDao();
		map = new HashMap<String, Object>();
		Bdao.updateBoard(map);
		System.out.println(map);
		return INPUT;
	}
	public String execute4() throws Exception {
		System.out.println("execute4()");
		map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		System.out.println(map);
		Bdao = new BoardDao();
		int flag = Bdao.insertBoard(map);
		if(flag == 1){
			text = "S";
		}else {
			text = "E";
		}
		return INPUT;
	}

}
