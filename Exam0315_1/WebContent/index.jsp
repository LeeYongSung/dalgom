<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.java.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var temp, temp_index;
	function del(no){
		document.getElementById("no").value = no;
		document.getElementById("check").value = "D";
		document.getElementById("frS").submit();
	}
	function edit(index){
		cancel();
		temp_index = index;
		temp = $(".title").eq(index).val();
		$(".title").eq(index).attr("readonly", false);
		$(".delete").eq(index).hide();
		$(".edit").eq(index).hide();
		$(".update").eq(index).show();
		$(".cancel").eq(index).show();
	}
	function cancel(){
		$(".title").eq(temp_index).val(temp);
// 		temp = "";
// 		temp_index = "";
		$(".title").attr("readonly", "readonly");
		$(".delete").show();
		$(".edit").show();
		$(".update").hide();
		$(".cancel").hide();
	}
	function update(index, no){
		document.getElementById("check").value = "U";
		document.getElementById("no").value = no;
		document.getElementById("title").value = $(".title").eq(index).val();
		document.getElementById("frS").submit();
	}
	function edit2(title, no){
		document.getElementById("title_U").value = title;
		document.getElementById("no_U").value = no;
	}
</script>
</head>
<body>
<form id="frS" action="/Exam0315/Servlet" onsubmit="return false;" method="post">
	<input type="hidden" name="no" id="no">
	<input type="hidden" name="title" id="title">
	<input type="hidden" name="check" id="check">
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
</form>
<hr>
<form action="/Exam0315/Servlet" method="post">
	<input type="hidden" name="check" value="I">
	제목 : <input type="text" name="title">
	<input type="submit" value="저장">
</form>
<hr>
<form action="/Exam0315/Servlet" method="post">
	<input type="hidden" name="check" value="U">
	<input type="hidden" name="no" id="no_U">
	제목 : <input type="text" name="title" id="title_U">
	<input type="submit" value="적용">
</form>
</body>
</html>




