package com.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private DataSource dataSource;
	
	public DAO(){
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<HashMap<String, Object>> select(){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map;
		String query = "SELECT * FROM J_FILE";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()){
				map = new HashMap<String, Object>();
				map.put("No", rs.getInt(1));
				map.put("Url", rs.getString(2));
				map.put("Name", rs.getString(3));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
				
		return list;
	}
	
	public void Insert(String url, String name, String type, String size){
		String query = "INSERT INTO J_FILE VALUES (SEQ_FILE.NEXTVAL,'"
		                 + url + "','"
		                 + name + "','"
		                 + type + "','"
		                 + size + "')";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			stmt.executeQuery(query);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
