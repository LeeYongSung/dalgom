package com.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class MybatisDAO {
	
	public SqlSessionFactory ssf = (SqlSessionFactory) com.java.SqlSessionFactory.getSession();
	private Logger logger = Logger.getLogger(MybatisDAO.class);
	
	public MybatisDAO(){}
	
	public List<HashMap<String, Object>> selectTemp(){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SqlSession session = ssf.openSession();
		try {
		  list = session.selectList("test.selectTemp");
		} finally {
		  session.close();
		}
		
		return list;
	}
	
	public void insertTemp(HashMap<String, Object> map){
		SqlSession session = ssf.openSession(true);
		try {
		  session.insert("test.insertTemp", map);
		} finally {
		  session.close();
		}	
	}
	
	public void deleteTemp(HashMap<String, Object> map){
		SqlSession session = ssf.openSession(true);
		try {
		  session.delete("test.deleteTemp", map);
		} finally {
		  session.close();
		}	
	}
	
	public void updateTemp(HashMap<String, Object> map){
		SqlSession session = ssf.openSession(true);
		try {
		  session.update("test.updateTemp", map);
		} finally {
		  session.close();
		}	
	}
}
