<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.box div { width : 30%; height : 100px; border : 1px solid; float:left; }
</style>
</head>
<body>
	<p><% request.getParameter("eq"); %></p> 
	<div class="box">
		<div></div>
		<div>신동준></div>
		<div>이용성</div>
	</div>
	<div class="box">
		<div></div>
		<div>오동규</div>
		<div></div>
	</div>
	<div class="box">
		<div>이진형</div>
		<div>안성진</div>
		<div>최형윤</div>
	</div>
	<div class="box">
		<div>황현우</div>
		<div>윤은정</div>
		<div>김서희</div>
	</div>
	<div class="box">
		<div>이민욱</div>
		<div>김민재</div>
		<div>이은혜</div>
	</div>
</body>
</html>