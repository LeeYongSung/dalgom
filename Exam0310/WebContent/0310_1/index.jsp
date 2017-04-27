<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<%!
	// 1
		String text;
		String[] list = new String[4];
		
		public int sum(int a, int b) {
			return a + b;
		}
		int i;
	//2
		int j = 10;
		String str = "ABCD";
		
		public String print(int aa, String s) {
			return aa + s;
		}
	%>
	<%
	// 1
		text = "Hello Goodee!";
		list[0] = "My";
		list[1] = "Name";
		list[2] = "Is";
		list[3] = "Hong";
		i = 0;
		while(true) {
			%>
			<h1><%= i %></h1>
			<% 
			i++;
			
			if(i == 9) {
				break;
			}
		}
	%>
	// 2
	<h1><%= print(j, str) %></h1>
	<h1><%= text %></h1>
	<h2><%= list[0] %> <%= list[1] %> <%= list[2] %> <%= list[3] %></h2>
	<h3><%= sum(2, 5) %></h3>
	--%>
	<form action="get.jsp" method="post">
		입력 : <input type="text" name="value">
		<input type="submit" value="이동">
	</form>
</body>
</html>