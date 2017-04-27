<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="2.jsp">
		ID : <input type="text" name="id">
		<br>
		PW : <input type="text" name="pw">
		<br>
		PW(확인) : <input type="text" name="pw">
		<br>
		
		Name : <input type="text" name="name">
		<br>
		남자 : <input type="radio" name="gender" value="m">
		여자 : <input type="radio" name="gender" value="f">
		<br>
		생일 : <input type="text" name="year">
		<select name="month">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
		</select>
		<input type="text" name="day">
		<br>
		본인확인 이메일 : <input type="text" name="email">
		<br>
		<input type="submit" value="가입">
	</form>
</body>
</html>