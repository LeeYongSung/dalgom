<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	out.println("서버 : " + request.getServerName());
	out.println("포트번호 : " + request.getServerPort());
	out.println("요청 방식 : " + request.getMethod());
	out.println("프로토콜 : " + request.getProtocol());
	out.println("URL : " + request.getRequestURL());
	out.println("URI : " + request.getRequestURI());
	
	out.println("입력 받은 값 : " + request.getParameter("value"));
	%>
</body>
</html>