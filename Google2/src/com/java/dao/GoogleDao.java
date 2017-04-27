package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class GoogleDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public HashMap<String, Object> selectUser(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectOne("google.selectUser", map);
	}
	
	public int insertBoard(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("google.insertUser", map);
	}
	
	public List<HashMap<String, Object>> UserList() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("google.UserList");
	}
	
	public List<HashMap<String, Object>> AuthList() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("google.AuthList");
	}
	
	public List<HashMap<String, Object>> MappingList(String userId) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("google.MappingList", userId);
	}
	
	public int insertMapping(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("google.insertMapping", map);
	}
}
