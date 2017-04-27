<%@page import="java.util.Arrays"%>
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
		int num1, num2, rs;
		String op;
		String[] food;
		String radio;
		
		public int sum() {
			int rs = 0;
			if("+".equals(op)) {
				rs = num1 + num2;
			} else if("-".equals(op)) {
				rs = num1 - num2;
			} else if("*".equals(op)) {
				rs = num1 * num2;
			} else if("/".equals(op)) {
				rs = num1 / num2;
			}
			
			return rs;
		}
	%>
	<% 
		num1 = Integer.parseInt(request.getParameter("num1"));
		op = request.getParameter("op");
		num2 = Integer.parseInt(request.getParameter("num2"));
		radio = request.getParameter("radio");
		food = request.getParameterValues("check");
	%>
	<p><%= sum() %></p>
	<p><%= Arrays.toString(food) %></p>
	<p><%= radio %></p>
</body>
</html>