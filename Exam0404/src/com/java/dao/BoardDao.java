package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class BoardDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> selectBoard() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("test.selectBoard");
	}
	
	public int deleteBoard(int no) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.update("test.deleteBoard", no);
	}
	public int insertBoard(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		int no = session.selectOne("test.selectNextNo");
		map.put("no", no);
		System.out.println(map);
		return session.insert("test.insertBoard", map);
	}
	public int updateBoard(HashMap<String,Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.update("test.updateBoard", map);
	}
}
