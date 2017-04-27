<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계산기</title>
</head>
<body>
	<form action="2.jsp">
		<input type="text" name="num1">
		<select name="op">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type="text" name="num2"> 
		<br>
		술 :    <input type="checkbox" name="check" value="술">
		담배 :   <input type="checkbox" name="check" value="담배">
		과자 :   <input type="checkbox" name="check" value="과자">
		중화요리 : <input type="checkbox" name="check" value="중화요리">
		치킨 :   <input type="checkbox" name="check" value="치킨">
		<br>
		ON : <input type="radio" name="radio" value="A" checked="checked">
		OFF : <input type="radio" name="radio" value="B">
		<br>
		<input type="submit" value="실행">
	</form>
</body>
</html>