package com.java;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;

public class BoardAction implements Action {

	private List<HashMap<String, Object>> list;
	public List<HashMap<String, Object>> getList() {
		return list;
	}
	private HashMap<String, Object> map;
	String No, Name, Desc,DelYn;
	public void setNo(String no) {
		No = no;
	}
	public void setName(String name) {
		Name = name;
	}
	public void setDesc(String desc) {
		Desc = desc;
	}
	public void setDelYn(String delYn) {
		DelYn = delYn;
	}
	
	public HashMap<String, Object> setMap(){
		map = new HashMap<String, Object>();
		map.put("No", this.No);
		map.put("Name", this.Name);
		map.put("Desc", this.Desc);
		map.put("DelYn", this.DelYn);
		return map;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("execute()");
		return SUCCESS;
	}
	
	public String select() throws Exception {
		System.out.println("select()");
		TestDAO Tdao = new TestDAO();
		list = Tdao.selectTemp();
		return SUCCESS;
	}
	
	public String insert() throws Exception {
		System.out.println("insert()");
		TestDAO Tdao = new TestDAO();
		Tdao.insertTemp(setMap());
		return SUCCESS;
	}
	
	public String update() throws Exception {
		System.out.println("update()");
		TestDAO Tdao = new TestDAO();
		Tdao.updateTemp(setMap());
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		System.out.println("delete()");
		TestDAO Tdao = new TestDAO();
		Tdao.deleteTemp(setMap());
		return SUCCESS;
	}

}
