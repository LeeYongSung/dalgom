<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {width: 80%; margin: 0 auto; padding: 0 auto;}
	h3 {text-align: center;margin: 8px 0;}
	label {width: 30px; display: inline-block; margin: 5px 0;}
	input.i {width: calc(100% - 40px); margin: 5px 0; float: right;}
	input.s {width: 100%; cursor: pointer;}
</style>
</head>
<body>
	<form action="B.jsp">
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="pw" id="pw">
		<input type="hidden" name="type" id="type">
		<h3>회원가입</h3>
		<label>ID</label><input type="text" name="idA" id="idA" class="i">
		<label>PW</label><input type="text" name="pwA" id="pwA" class="i">
		<label>NM</label><input type="text" name="nm" id="nm" class="i">
		<input type="submit" value="Add" onclick="check('A');" class="s">
	</form>
</body>
</html>