<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%!
 	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
 	String DB_USER = "JAVA";
 	String DB_PASSWORD = "JAVA";
 	
 	Connection conn = null;
 	Statement stmt = null;
 	ResultSet rs = null;
	
 	String query = "";
 %>
 <%
 	try {
 		Class.forName("oracle.jdbc.driver.OracleDriver");
 	} catch(ClassNotFoundException e) {
 		e.printStackTrace();
 	}
 
	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = conn.createStatement();
		
		query = "SELECT ONCHECK, TITLE, CONTENT, CNT, REG_DATE FROM BOARDER";
		
		stmt.executeQuery(query);
		
		response.sendRedirect("C.jsp?query=" + query);
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
 %>
</body>
</html>