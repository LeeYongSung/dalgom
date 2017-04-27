package com.java.util;

import java.util.Date;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCheckingListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent session) {
		System.out.println("Created Session ID : ".concat(session.getSession().getId()).concat(new Date().toString()));
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent session) {
		System.out.println("Destroyed Session ID : ".concat(session.getSession().getId()).concat(new Date().toString()));
	}

}
