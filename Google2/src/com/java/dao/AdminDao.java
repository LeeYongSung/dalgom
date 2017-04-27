package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class AdminDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> selectUsers() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("admin.selectUsers");
	}
	
	public List<HashMap<String, Object>> selectAuths() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("admin.selectAuths");
	}
	
	public List<HashMap<String, Object>> selectMappings(String userId) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("admin.selectMappings", userId);
	}
	
	public int insert(HashMap<String, Object> map){
		SqlSession session = ssf.openSession(true);
		return session.insert("admin.insert", map);
	}
	
	public int delete(HashMap<String, Object> map){
		SqlSession session = ssf.openSession(true);
		return session.update("admin.delete", map);
	}
	
	public HashMap<String, Object> login(String email) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectOne("admin.login", email);
	}
	
}
