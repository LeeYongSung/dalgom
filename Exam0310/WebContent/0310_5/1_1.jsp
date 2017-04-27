<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="1_2.jsp">
		<select name="q">
			<option>1조</option>
			<option>2조</option>
			<option>3조</option>
			<option>4조</option>
			<option>5조</option>
		</select>
		<br>
		안경을 쓰셨나요 ?
		<br> 
		네 : <input type="radio" name="glass" value="Y">
		아니요 : <input type="radio" name="glass" value="N">
		<br>
		성별이 어떻게 되시나요?
		<br> 
		남 :  <input type="radio" name="sex" value="male">
		여 : <input type="radio" name="sex" value="female">
		<br>
		키가 170이 넘나요? 
		<br>
		네 : <input type="radio" name="height" value="170up">
		아니요 : <input type="radio" name="height" value="170down">
		<br>
		<input type="submit" value="실행">
		
	</form>
</body>
</html>