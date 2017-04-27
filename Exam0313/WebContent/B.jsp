<%@page import="org.apache.catalina.Session"%>
<%@ include file="C.jsp" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
HttpSession s = request.getSession();
String a = "";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script>
	if("form".equals("form")) {
		s.setAttribute("id", id);
		s.setAttribute("pw", pw);
		s.setAttribute("name", name);
	} else {
		if("id1".equals("id")) {
			response.sendRedirect("C.jsp");
		} else {
			alert("틀렸습니다.");
		}
	
	}
	</script>
</head>
<body>
	<%= id %>
	<%= pw %>
	<%= name %>
</body>
</html>