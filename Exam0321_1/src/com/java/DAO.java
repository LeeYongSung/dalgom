package com.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
//	Statement stmt = null;
	PreparedStatement pstmt = null;
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
	
	public List<HashMap<String, Object>> selectTemp(){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map;
		String Query = "select * from temp";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(Query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map = new HashMap<String, Object>();
				map.put("No", rs.getInt(1));
				map.put("Name", rs.getString(2));
				map.put("Desc", rs.getString(3));
				map.put("DelYn", rs.getString(4));
				list.add(map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	public void insertTemp(HashMap<String, Object> map){
		String Query = "insert into temp values (?,?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1, Integer.parseInt(map.get("No").toString()));
			pstmt.setString(2, map.get("Name").toString());
			pstmt.setString(3, map.get("Desc").toString());
			pstmt.setString(4, map.get("DelYn").toString());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
}





