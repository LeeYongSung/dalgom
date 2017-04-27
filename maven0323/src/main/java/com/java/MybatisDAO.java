package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MybatisDAO {
	
	public SqlSessionFactory ssf = (SqlSessionFactory) com.java.SqlSessionFactory.getSession();
	
	public MybatisDAO(){}
	
	public List<HashMap<String, Object>> select(String search){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SqlSession session = ssf.openSession();
		try {
		  list = session.selectList("test.select", search);			
		} finally {
		  session.close();
		}
		
		return list;
	}

	
}
