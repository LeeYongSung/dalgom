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
		String rs;
	%>
	<% 
		rs = request.getParameter("rs");
	
		if("Y".equals(rs)) {
			%><h1> ȯ���մϴ�. </h1><% 
		} else {
			%><h1> �ٽ� �Է��� �ּ���. </h1><%
		}
	%>
</body>
</html>