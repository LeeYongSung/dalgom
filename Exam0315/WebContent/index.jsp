<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.java.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트</title>
<style>
	table, td, tr {
		border: 1px solid;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function del(no){
		document.getElementById("DEL").value = no;
		document.getElementById("check").value = "D";
		document.getElementById("fr").submit();
	}
	function update(no, index) {
		document.getElementById("DEL").value = no;
		$(".title").eq(index).attr("readonly", false);
	}
	function save() {
		document.getElementById("check").value = "U";
		document.getElementById("fr").submit();
	}
</script>
</head>
<body>
	<form id="fr" action="/Exam0315/Servlet" method="post" onsubmit="return false;">
		<input type="hidden" id="DEL" name="DEL">
		<input type="hidden" name="check" value="check">
			<%!
				List<HashMap<String, Object>> list;
			%>
			<%
				list = new ArrayList<HashMap<String, Object>>();
				DAO dao = new DAO();
				list = dao.selectBoarder();
			%>
				<table>
				<tr>
					<th>OnCheck</th>
					<th>Title</th>
					<th>Cnt</th>
					<th>RegDate</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="list" items="<%= list %>">
					<tr>
						<td>
							${ list.OnCheck }
						</td>
						<td>
							${ list.Title }
						</td>
						<td>
							${ list.Cnt }
						</td>
						<td>
							${ list.RegDate }
						</td>		
					</tr>	
				</c:forEach>
			</table>
	<input type="button" onclick="save()" id="save" value="적용">
</form>
<hr>
<form action="/Exam0315/Servlet" method="post">
	<input type="hidden" name="check" value="I">
	제목 : <input type="text" name="title">
	<input type="submit" value="저장">
</form>
<hr>
<%-- 
<form action="/Exam0315/Servlet" method="post">
	<input type="hidden" name="check" value="U">
	<input type="hidden" name="check" value="U">
	<input type="text" name="upda1">
	<input type="text" name="upda">
	<input type="submit" value="수정">
</form>
--%>
</body>
</html>