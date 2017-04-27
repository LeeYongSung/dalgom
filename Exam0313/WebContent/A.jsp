<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		
		var a = document.getElementById("id").value;
		var b = document.getElementById("pw").value;
		var c = document.getElementById("name").value;
		
		if(a == "") {
			alert("아이디를 입력하세요.");
			return false;
		} 
		if (b == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		} 
		if (c == "") {
			alert("이름을 입력하세요.");
			return false;
		} 
		
		var form = document.getElementById("form");
		form.submit();

	}
function check1() {
		
		var a = document.getElementById("id1").value;
		var b = document.getElementById("pw1").value;
		
		if(a == "") {
			alert("아이디를 입력하세요.");
			return false;
		} 
		if (b == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		} 
		
		var form2 = document.getElementById("form2");
		form2.submit();

	}
</script>
</head>
<body>
	<form id="form" action="B.jsp" onsubmit="return false">
		ID : <input type="text" name="id" id="id">
		<span id="span"></span>
		<br>
		PW : <input type="text" name="pw" id="pw">
		<span id="span"></span>
		<br>
		NM : <input type="text" name="name" id="name">
		<span id="span"></span>
		<br>
		<input type="hidden" value="form" id="form_1">
		<input type="submit" value="ADD" onclick="check();" id="add">
		<br>
		<hr>
		<br>
		</form>
		
		<form id="form2" action="B.jsp" onsubmit="return false">
		ID : <input type="text" name="id1" id="id1">
		<br>
		PW : <input type="text" name="pw1" id="pw1">
		<br>
		<input type="hidden" value="form2" id="form2_1">
		<input type="submit" value="Apply" onclick="check1()" id="app">
	</form>
</body>
</html>