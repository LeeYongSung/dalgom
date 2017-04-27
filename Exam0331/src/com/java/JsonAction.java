package com.java;

import com.opensymphony.xwork2.Action;

public class JsonAction implements Action {
	
	String a, b, c, d, e;
	public String getA() {
		return a;
	}
	public String getB() {
		return b;
	}
	public String getC() {
		return c;
	}

	@Override
	public String execute() throws Exception {
		a = "a";
		b = "b";
		c = "c";
		d = "d";
		e = "e";
		return SUCCESS;
	}

}
