package com.java.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class BoardDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> selectBoard() throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectList("board.selectBoard");
	}
	
	public HashMap<String, Object> selectDetailBoard(int boardNo) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.selectOne("board.selectDetailBoard", boardNo);
	}
	
	public int insertBoard(Map<String, Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.insert("board.insertBoard", map);
	}
	
	public int updateBoard(Map<String, Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.update("board.updateBoard", map);
	}
	
	public int deleteBoard(Map<String, Object> map) throws SQLException{
		SqlSession session = ssf.openSession(true);
		return session.update("board.deleteBoard", map);
	}
	
}
