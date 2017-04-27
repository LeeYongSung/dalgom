package com.java.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.java.common.SqlMapClientManager;

public class LoginDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> loginSelect() throws SQLException {
		SqlSession session = ssf.openSession(true);
		
		return session.selectList("login.loginSelect");
	}
}
