<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
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
	<table>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.No}</td>
				<td>${list.Name}</td>
				<td>${list.Desc}</td>
				<td>${list.DelYn}</td>
				<td><button type="button" onclick="del('${list.No}')">삭제</button></td>
				<td><button type="button" onclick="up('${list.No}','${list.Name}','${list.Desc}','${list.DelYn}')">수정</button></td>
			</tr>
		</c:forEach>	
	</table>
	<hr>
	<form action="/Exam0330/board/insert.action" method="post">
		No : <input type="text" name="No"><br>
		Name : <input type="text" name="Name"><br>
		Desc : <input type="text" name="Desc"><br>
		DelYn : <input type="text" name="DelYn"><br>
		<input type="submit" value="입력">
	</form>
	<form action="/Exam0330/board/delete.action" method="post" id="frD">
		<input type="hidden" name="No" id="delNo">
	</form>
	<hr>
	<form action="/Exam0330/board/update.action" method="post" id="frU" style="display: none;">
		<input type="hidden" name="No" id="upNo"><br>
		Name : <input type="text" name="Name" id="upName"><br>
		Desc : <input type="text" name="Desc" id="upDesc"><br>
		DelYn : <input type="text" name="DelYn" id="upDelYn"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>
