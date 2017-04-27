<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	function del_event(no) {
		$.get("/Exam0331/TestAction!execute2.lys?no=" + no, function (data, status){
			console.log(data);
				alert(data);
			var result = data;
			if(result == "S") {
				alert("성공" + ", " + no);
				location.href = "/Exam0331/TestAction!execute.lys";
			} else {
				alert("실패" + ", " + no);
			}
		});
	}
	function in_event(no, title, content) {
		document.getElementById("frU").style.display = "";
		document.getElementById("Uno").value = no;
		document.getElementById("Utitle").value = title;
		document.getElementById("Ucontent").value = content;
	}
	
	$(document).ready(function(){
		$("#ins").click(function(){
			alert("-----------");
			var title = document.getElementById("Ititle").value;
			var content = document.getElementById("Icontent").value;
			alert(title + ", " + content);
			$.get("/Exam0331/TestAction!execute4.lys?title=" + title + "&content=" + content, function (data, status){
				console.log(no + title + content);
				if(result == "S") {
					alert("성공" + ", " + no + ", " + title + ", " + content);
					location.href = "/Exam0331/TestAction!execute.lys";
				} else {
					alert("실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>test</h1>
	<s:property value="text"/>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제여부</th>
			<th>유저</th>
		</tr>
 		<s:iterator value="list"> <%--for문과 값음 --%>
			<tr>
				<td><s:property value="NO"/></td>
				<td><s:property value="TITLE"/></td>
				<td><s:property value="CONTENT"/></td>
				<td><s:property value="DEL_YN"/></td>
				<td><s:property value="REG_USER"/></td>
				<td><button type="button" onclick="del_event('<s:property value="NO"/>')">삭제</button></td>
				<td><button type="button" onclick="in_event('<s:property value="NO"/>', '<s:property value="TITLE"/>', '<s:property value="CONTENT"/>')">수정</button></td>
			</tr> 
		</s:iterator>
	</table>
	<hr>
	<div>
		제목 : <input type="text" name="Title" id="Ititle">
		내용 : <input type="text" name="Content" id="Icontent">
		<button type="button" id="ins">입력</button>
	</div>
	<hr>
	<div id="frU" style="display: none;">
		번호 : <input type="text" name="No" id="Uno">
		제목 : <input type="text" name="Title" id="Utitle">
		내용 : <input type="text" name="Content" id="Ucontent">
		<input type="submit" value="수정">
	</div> 
	
</body>
</html>