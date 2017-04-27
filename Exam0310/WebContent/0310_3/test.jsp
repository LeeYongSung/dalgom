<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ include file="test2.jsp" %> <%-- 두가지를 결합하여 쓸 때 사용하는 지시자 --%>
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
		List<String> list = new ArrayList<String>();
	%>
	<%
		list.add("1");
		list.add("2");
		list.add("3");
		
		for(int i =0; i < list.size(); i++) {
			out.println(list.get(i));
		}
	%>
</body>
</html>