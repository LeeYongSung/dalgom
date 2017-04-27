package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class GoogleDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public int insertBoard(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("google.insertUser", map);
	}
	
	public List<HashMap<String, Object>> selectName() throws SQLException {
		SqlSession session = ssf.openSession();
		return session.selectList("google.selectName");
	}
	public List<HashMap<String, Object>> selectAuth() throws SQLException {
		SqlSession session = ssf.openSession();
		return session.selectList("google.selectAuth");
	}
	public List<HashMap<String, Object>> selectMapping(String userId) throws SQLException {
		SqlSession session = ssf.openSession(true);
		return session.selectList("google.selectMapping", userId);
	}
	public int insertAuth(HashMap<String, Object> map) throws SQLException {
		SqlSession session = ssf.openSession(true);
		return session.insert("google.insertAuth", map);
	}
	public int delete(HashMap<String, Object> map) throws SQLException {
		SqlSession session = ssf.openSession(true);
		return session.delete("google.delete", map);
	}
}
