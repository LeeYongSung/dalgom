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
	out.println("���� : " + request.getServerName());
	out.println("��Ʈ��ȣ : " + request.getServerPort());
	out.println("��û ��� : " + request.getMethod());
	out.println("�������� : " + request.getProtocol());
	out.println("URL : " + request.getRequestURL());
	out.println("URI : " + request.getRequestURI());
	
	out.println("�Է� ���� �� : " + request.getParameter("value"));
	%>
</body>
</html>