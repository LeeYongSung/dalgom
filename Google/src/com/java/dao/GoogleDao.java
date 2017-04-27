package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class GoogleDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public int insertBoard(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("google.insertUser", map);
	}
}
