<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.java.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File upload</title>
</head>
<body>
	<form action="/Exam0320/FileServlet" method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="file">
		<input type="submit" value="업로드">
	</form>
	<%!
		String url;
		DAO dao;
		List<HashMap<String, Object>> list;
	%>
	<%
		list = new ArrayList<HashMap<String, Object>>();
		dao = new DAO();
		list = dao.select();
		
		for(int i = 0; i < list.size(); i++){
			%>
				<img 
				alt="<%= list.get(i).get("Name") %>" 
				src="<%= list.get(i).get("Url") %>">
				<hr>
			<%
		}
	%>
	
</body>
</html>












