package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class LoginDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public HashMap<String, Object> selectUser(HashMap<String, Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectOne("login.selectUser", map);
	}
	
	public HashMap<String, Object> selectUserDetail(String email) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectOne("login.selectUserDetail", email);
	}
	
	public int insertUser(HashMap<String, Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("login.insertUser", map);
	}
	
}
