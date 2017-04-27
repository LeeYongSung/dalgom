<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Struts 화면</h1>
	<a href="/Exam0330/menu/index.action">두번째 화면 이동</a>
	<form action="/Exam0330/menu/index.action" method="post">
		<input type="text" name="text">
		<input type="submit" value="데이터 전달">
	</form>
</body>
</html>