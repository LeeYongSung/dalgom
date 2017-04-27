package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;

public class TestAction implements Action {
	
	TestDAO mdao = new TestDAO();
	HashMap<String, Object> map;
	List<HashMap<String, Object>> data;
	String No, Name, Desc, DelYn;

	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		setHashMap();
		data = new ArrayList<HashMap<String, Object>>();
		data = mdao.selectTemp();
		return SUCCESS;
	}
	
	public String insert() throws Exception {
		System.out.println("insert()");
		mdao.insertTemp(setHashMap());
		return SUCCESS;
	}
	
	public String update() throws Exception {
		System.out.println("update()");
		mdao.updateTemp(setHashMap());
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		System.out.println("delete()");
		mdao.deleteTemp(setHashMap());
		return SUCCESS;
	}
	
	public HashMap<String, Object> setHashMap(){
		map = new HashMap<String, Object>();
		map.put("No", this.No);
		map.put("Name", this.Name);
		map.put("Desc", this.Desc);
		map.put("DelYn", this.DelYn);
//		this.No = "";
//		this.Name = "";
//		this.Desc = "";
//		this.DelYn = "";
		System.out.println(map);
		return map;
	}

	public String getNo() {
		return No;
	}

	public void setNo(String no) {
		No = no;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDesc() {
		return Desc;
	}

	public void setDesc(String desc) {
		Desc = desc;
	}

	public String getDelYn() {
		return DelYn;
	}

	public void setDelYn(String delYn) {
		DelYn = delYn;
	}

	public List<HashMap<String, Object>> getData() {
		return data;
	}

	public void setData(List<HashMap<String, Object>> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "TestAction [No=" + No + ", Name=" + Name + ", Desc=" + Desc + ", DelYn=" + DelYn + "]";
	}
}
