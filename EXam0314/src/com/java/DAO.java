package com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

public class DAO {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String DB_USER = "JAVA";
	String DB_PASSWORD = "JAVA";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String query, id, pw, nm;
	
	String button;
	public DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public HashMap<String, Object> selectUser(String id, String pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		query = "select J_ID, J_PW, J_NM ";
		query += "from J_USER where J_ID = 'admin' and J_PW = 'admin'";
		
		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()){
				this.id = rs.getString(1);
				this.pw = rs.getString(1);
				this.nm = rs.getString(1);
			}
			map.put("id", this.id);
			map.put("pw", this.pw);
			map.put("nm", this.nm);
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
		return map;
	}
}
