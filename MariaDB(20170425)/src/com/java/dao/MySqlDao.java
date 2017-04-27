package com.java.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.java.common.SqlMapClientManager;

public class MySqlDao {
	public SqlSessionFactory ssf = SqlMapClientManager.getSession();
	
	public List<HashMap<String, Object>> selectTable() throws SQLException{
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("db.selectTable");
		} finally {
			session.close();
		}
		return list;
	}
	
	
}
