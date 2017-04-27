<%@page import="java.util.ArrayList"%>
<%@page import="com.java.dao.MySqlDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MariaDB</title>
</head>
<body>
<% 
	List<HashMap<String, Object>> list;
	MySqlDao mdao;
%>
<%
	list = new ArrayList<HashMap<String, Object>>();
	mdao = new MySqlDao();
	list = mdao.selectTable();
%>
	<table>
	<tr>
		<th>Table</th>
		<th>Name</th>
		<th>hiredate</th>
		<th>delyn</th>
	</tr>
	<%
	for(int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%= list.get(i).get("user_no") %></td>
			<td><%= list.get(i).get("user_name") %></td>
			<td><%= list.get(i).get("hire_date") %></td>
			<td><%= list.get(i).get("del_yn") %></td>
		</tr>
		<%
	}
	 %>
 </table>
</body>
</html>