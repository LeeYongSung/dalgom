package com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;



public class DAO {
	
//	String Url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
//	String User = "java";
//	String Password = "java";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private DataSource dataSource;
	
	public DAO(){
//		try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//        } catch (ClassNotFoundException e) {
//                e.printStackTrace();
//        }
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle");
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}
	
	public List<HashMap<String, Object>> selectBoarder(){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map;
		String query = "SELECT * FROM BOARD WHERE DEL_YN = 'N'";
		
		try {
//			conn = DriverManager.getConnection(Url, User, Password);
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()){
				map = new HashMap<String, Object>();
				map.put("No", rs.getInt(1));
				map.put("Title", rs.getString(2));
				map.put("Content", rs.getString(3));
				map.put("Cnt", rs.getInt(4));
				map.put("OnCheck", rs.getString(5));
				map.put("RegDate", rs.getDate(7));
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
	
	public void delBoard(String no){
		String query = "UPDATE BOARD SET DEL_YN = 'Y' WHERE NO = " + no;
		
		try {
//			conn = DriverManager.getConnection(Url, User, Password);
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
	
	public void InsertBoard(String title){
		String query = "INSERT INTO BOARD (NO, TITLE) VALUES (SEQ_BOARDER.NEXTVAL,'" + title + "')";
		
		try {
//			conn = DriverManager.getConnection(Url, User, Password);
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
	
	public void UpdateBoard(String title, String no){
		String query = "UPDATE BOARD SET TITLE = '" + title + "' WHERE NO = " + no;
		
		try {
//			conn = DriverManager.getConnection(Url, User, Password);
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
