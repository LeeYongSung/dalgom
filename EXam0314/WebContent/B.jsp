<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String type, id, pw, nm, flag;
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
		
		public String setList(HttpSession session) {
			try {
				boolean check = true;
				if(session.getAttribute("user") != null) {
					list = (List<HashMap<String, Object>>) session.getAttribute("user");
					for(int i = 0; i < list.size(); i++){
						if(list.get(i).get("id").equals(id)) {
							check = false;
							break;
						}
					}
				}
				if(check) {
					map = new HashMap<String, Object>();
					map.put("id", id);
					map.put("pw", pw);
					map.put("nm", nm);
					list.add(map);
					s.setAttribute("user", list);
					flag = "Y";
				} else {
					flag = "N";
				}
			}catch(Exception e) {
				e.printStackTrace();
				flag = "N";
			}
			return flag;
		}
	%>
	<%
		type = request.getParameter("type");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		list = new ArrayList<HashMap<String, Object>>();
		s = request.getSession();
		String ch = "";
		if("A".equals(type)){
			
				nm = request.getParameter("nm");
				flag = setList(s);
				response.sendRedirect("C.jsp?type="+ type + "&flag=" + flag);
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
						response.sendRedirect("A.jsp?key=ch");
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
			/*
			if(s.getAttribute("user") != null) {
				list = (List<HashMap<String, Object>>) session.getAttribute("user");
				String check = "";
				for(int i = 0; i < list.size(); i++){
					if(list.get(i).get("id").equals(id)) {
						if(list.get(i).get("pw").equals(pw)) {
							nm = list.get(i).get("nm").toString();
							check = "Y";
							break;
						} else {
							check = "P";
							break;
						}
					}
				}
				if(check == "Y"){
				response.sendRedirect("C.jsp?type="+type+"&id="+id+"&pw="+pw+"&nm="+nm);
				} else if(check == "P") {
				response.sendRedirect("A.jsp?key=pw");
				} else {
				response.sendRedirect("A.jsp?key=id");
				}
			} else {
				response.sendRedirect("A.jsp?key=s");
			}
		} else {
			response.sendRedirect("A.jsp?key=e");
		}
			*/
			
			
			query = "select J_ID, J_PW, J_NM from J_USER ";
			query += "where J_ID = '" + id + "' and J_PW = '" + pw + "'";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				flag = "";
				
				while(rs.next()) {
					//id = rs.getString(1);
					//pw = rs.getString(2);
					nm = rs.getString(3);
					flag = "Y";
				}
				if("Y".equals(flag)) {
					s.setAttribute("nm", nm);
					response.sendRedirect("C.jsp?type="+type+"&id="+id+"&pw="+pw);
				} else {
					response.sendRedirect("A.jsp?key=ip");
				}
				
				
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
		%>
</body>
</html>