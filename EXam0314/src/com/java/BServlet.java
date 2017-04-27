package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/BServlet")
public class BServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type, id, pw, nm = null, flag = null;
		List<HashMap<String, Object>> list;
		HashMap<String, Object> map;
		HttpSession s;
		
		String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		String DB_USER = "JAVA";
		String DB_PASSWORD = "JAVA";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query;
		

		type = request.getParameter("type");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		list = new ArrayList<HashMap<String, Object>>();
		s = request.getSession();
		String ch = "";
		if("A".equals(type)){
			
				nm = request.getParameter("nm");
				query = "insert into J_USER (J_ID, J_PW, J_NM, DEL_YN) VALUES ";
				query += "('" + id +"', '" + pw + "' , '" + nm +"', '" + "Y" + "')";
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
				} catch(ClassNotFoundException e) {
					e.printStackTrace();
				}
				try {
					conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
					stmt = conn.createStatement();
					flag = "Y";
					rs = stmt.executeQuery("select * from J_USER");
					while(rs.next()){
						if(id.equals(rs.getString(1))){
							flag = "N";	
						}
					}
					if(flag.equals("Y")) {
						stmt.executeQuery(query);
						response.sendRedirect("C.jsp?type="+type+"&flag="+flag);
					} else {
						response.sendRedirect("C.jsp?type="+type+"&flag="+flag);
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
			
		} else if("B".equals(type)) {
			map = new HashMap<String, Object>();
			
			DAO dao = new DAO();
			map = dao.selectUser(id, pw);
			
			if(map.size() == 0) {
				
			} else {
				
			}
//			query = "select J_ID, J_PW, J_NM from J_USER ";
//			query += "where J_ID = '" + id + "' and J_PW = '" + pw + "'";
//			try {
//				Class.forName("oracle.jdbc.driver.OracleDriver");
//			} catch(ClassNotFoundException e) {
//				e.printStackTrace();
//			}
//			try {
//				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//				stmt = conn.createStatement();
//				rs = stmt.executeQuery(query);
//				flag = "";
//				
//				while(rs.next()) {
//					
//					nm = rs.getString(3);
//					flag = "Y";
//				}
//				if("Y".equals(flag)) {
//					s.setAttribute("nm", nm);
//					response.sendRedirect("C.jsp?type="+type+"&id="+id+"&pw="+pw);
//				} else {
//					response.sendRedirect("A.jsp?key=ip");
//				}
//		
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//		} finally {
//			try {
//				stmt.close();
//				conn.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		}
//		
//	}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
