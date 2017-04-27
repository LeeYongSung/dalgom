package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import com.java.dao.BoardDao;
import com.opensymphony.xwork2.Action;

public class BoardAction implements Action, SessionAware {

	private Map<String, Object> SessionMap, DataMap, map;
	public Map<String, Object> getDataMap() {
		return DataMap;
	}
	private List<HashMap<String,Object>> list;
	public List<HashMap<String, Object>> getList() {
		return list;
	}
	private String message, title, content;
	public String getMessage(){
		return message;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private int boardNo, cnt;
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCnt() {
		return cnt;
	}
	@Override
	public String execute() throws Exception {
		BoardDao bDao = new BoardDao();
		list = new ArrayList<HashMap<String, Object>>();
		map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("email", SessionMap.get("email"));
		list = bDao.selectBoard();
		return SUCCESS;
	}
	public String detail() throws Exception {
		BoardDao bDao = new BoardDao();
		DataMap = new HashMap<String, Object>();
		DataMap = bDao.selectDetailBoard(boardNo);
		return SUCCESS;
	}
	public String insert() throws Exception {
		BoardDao bDao = new BoardDao();
		map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("email", SessionMap.get("email"));
		cnt = bDao.insertBoard(map);
		return SUCCESS;
	}
	public String update() throws Exception {
		BoardDao bDao = new BoardDao();
		map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("email", SessionMap.get("email"));
		map.put("boardNo", boardNo);
		cnt = bDao.updateBoard(map);
		return SUCCESS;
	}
	public String delete() throws Exception {
		BoardDao bDao = new BoardDao();
		map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("email", SessionMap.get("email"));
		cnt = bDao.deleteBoard(map);
		return SUCCESS;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		SessionMap = new HashMap<String, Object>();
		SessionMap = session;
	}

}
