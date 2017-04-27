<%@page import="com.java.MybatisDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.java.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Temp</title>
<script type="text/javascript">
	function del(no){
		document.getElementById("delNo").value = no;
		document.getElementById("frD").submit();
	}
	function up(no, name, desc, delyn){
		document.getElementById("frU").style.display = "";
		document.getElementById("upNo").value = no;
		document.getElementById("upName").value = name;
		document.getElementById("upDesc").value = desc;
		document.getElementById("upDelYn").value = delyn;
	}
</script>
</head>
<body>
	<%!
		List<HashMap<String, Object>> list;
		DAO dao;
		MybatisDAO mdao;
	%>
	<table>
	<%
		list = new ArrayList<HashMap<String, Object>>();
		dao = new DAO();
		mdao = new MybatisDAO();
		
// 		list = dao.selectTemp();
		list = mdao.selectTemp();
		
		for(int i = 0; i < list.size(); i++){
			%>
				<tr>
					<td><%= list.get(i).get("No") %></td>
					<td><%= list.get(i).get("Name") %></td>
					<td><%= list.get(i).get("Desc") %></td>
					<td><%= list.get(i).get("DelYn") %></td>
					<td><button type="button" onclick="del('<%= list.get(i).get("No")%>')">삭제</button></td>
					<td><button type="button" onclick="up('<%= list.get(i).get("No")%>','<%= list.get(i).get("Name")%>','<%= list.get(i).get("Desc")%>','<%= list.get(i).get("DelYn")%>')">수정</button></td>
				</tr>	
			<%
		}
	%>
	</table>
	<hr>
	<form action="/Exam0321/insertTemp.do" method="post">
		No : <input type="text" name="No"><br>
		Name : <input type="text" name="Name"><br>
		Desc : <input type="text" name="Desc"><br>
		DelYn : <input type="text" name="DelYn"><br>
		<input type="submit" value="입력">
	</form>
	<form action="/Exam0321/deleteTemp.do" method="post" id="frD">
		<input type="hidden" name="No" id="delNo">
	</form>
	<hr>
	<form action="/Exam0321/updateTemp.do" method="post" id="frU" style="display: none;">
		<input type="hidden" name="No" id="upNo"><br>
		Name : <input type="text" name="Name" id="upName"><br>
		Desc : <input type="text" name="Desc" id="upDesc"><br>
		DelYn : <input type="text" name="DelYn" id="upDelYn"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>
