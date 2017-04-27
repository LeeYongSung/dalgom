package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class MenuDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> selectMenu(String email) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("menu.selectMenu", email);
	}
	
}
