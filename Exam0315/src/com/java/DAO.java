package com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DAO {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
 	String DB_USER = "JAVA";
 	String DB_PASSWORD = "JAVA";
 	
 	Connection conn = null;
 	Statement stmt = null;
 	ResultSet rs = null;
	
 	String query = "";
 	String query1 = "";
 	public DAO() {
 		try {
 	 		Class.forName("oracle.jdbc.driver.OracleDriver");
 	 	} catch(ClassNotFoundException e) {
 	 		e.printStackTrace();
 	 	}
 	}
 	
 	public List<HashMap<String, Object>> selectBoarder() {
 		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
 		HashMap<String, Object> map;
 		query = "select * from boarder where DEL_YN = 'N'";
 		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			
			while(rs.next()){
				map = new HashMap<String, Object>();
				map.put("NO", rs.getString(1));
				map.put("TITLE", rs.getString(2));
				map.put("CONTENT", rs.getString(3));
				map.put("CNT", rs.getInt(4));
				map.put("ONCHECK", rs.getString(5));
				map.put("DEL_YN", rs.getString(6));
				map.put("REGDATE", rs.getDate(7));
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
 	public void delete(String no) {
 		query = "update boarder set DEL_YN = 'y' where no =" + no;
 		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
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
 	
 	public void insert(String ti) {
 		query = "insert into boarder (NO, ONCHECK, TITLE, CNT) values ";
 		query += "(SEQ_BOARDER.NEXTVAL, '',"+ " '" + ti + "', " + "'' )";
 		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
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
// 	public void update(String up1, String up2) {
// 		query = "update boarder set TITLE = '" + up1 + "' where TITLE = '" + up2 +"'";
// 		try {
//			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//			stmt = conn.createStatement();
//			stmt.executeQuery(query);			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				stmt.close();
//				conn.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//	}
}
