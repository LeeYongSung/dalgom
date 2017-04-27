<%@page import="java.util.ArrayList"%>
<%@page import="com.java.MybatisDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
		List<HashMap<String, Object>> list;
		MybatisDAO mdao;
		HttpSession s;
	%>
	<table>
	<%
		list = new ArrayList<HashMap<String, Object>>();
		mdao = new MybatisDAO();
		s = request.getSession();
		list = mdao.select(s.getAttribute("search").toString());
		
	%>
	<%
		if(list.size() != 0){
			for(int i = 0; i < list.size(); i++){
				%>
					<tr>
						<td><%= list.get(i).get("MAVEN_NO") %></td>
						<td><%= list.get(i).get("MAVEN_NAME") %></td>
						<td><%= list.get(i).get("MAVEN_GENDER") %></td>
						<td><%= list.get(i).get("DEL_YN") %></td>
					</tr>
				<%
			}
		}else{
		 %>
			<tr>
				<td>검색 결과가 없습니다.</td>
			</tr>
		 <%
		}
	%>	
	</table>
</body>
</html>