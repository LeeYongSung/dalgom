<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String id; %>
<% 
	id = "lys"; 
	
	HttpSession s = request.getSession();
	s.setAttribute("key", "12345"); // (key, value) // getAttribute
	
	Cookie cook = new Cookie("cook", "OOOOP"); // (key, value)
	response.addCookie(cook);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function id_check() {
		alert('<%= id %>');
		if('<%= id %>' != document.getElementById("id").value) {
			alert("사용가능합니다.");
		} else {
			alert("불가능합니다.");
		}
	}
	
	function pw_check() {
		
		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
		
		if(pw == pw2) {
			document.getElementById("re").innerHTML = "일치합니다.";
			document.getElementById("pw").style.backgroundColor = "white";
			document.getElementById("pw2").style.backgroundColor = "white";
		} else {
			document.getElementById("re").innerHTML = "불일치합니다.";
			document.getElementById("pw").style.backgroundColor = "red";
			document.getElementById("pw2").style.backgroundColor = "red";
		}
	}
	
	function check() {
		
		if(docume2nt.getElementById("id").value == "") {
			alert("아이디를 입력해주세요.");
		} else if(document.getElementById("pw").value == "") {
			alert("비밀번호를 입력해주세요.");
		} else {
			alert("빈칸이 있습니다.")
		}
	}
	
	function submitAction() {
		var name = document.getElementById("name").value;
		
		if(name == "") {
			alert("이름을 입력하세요.")
			return false;
		} 
		
			var form = document.getElementById("form");
			form.submit();
		
	}
</script>
</head>
<body>

	${key}
	<%-- 
	<jsp:useBean id="u" class="com.java.bean.UserBean"></jsp:useBean> <%-- UserBean u = new UserBean() ; --%>
	<%-- <jsp:setProperty property="id" name="u" value="lys"/> 
	<jsp:setProperty property="pw" name="u" value="1234"/>
		
	
	
	<%--
	<jsp:getProperty property="id" name="u"/>
	<jsp:getProperty property="pw" name="u"/>
	
	
	<%
		out.print(u.getId());
		out.print(u.getPw());
	%>
	 --%>
	 <%--
	<form action="result.jsp">
		<input type="text" name="id">
		<input type="hidden" name="pw" value="<%= u.getPw() %>">
		<input type="submit" value="전송">
	</form>
	 --%>
	<form  id="form" action="result.jsp" onsubmit="return false;">
		ID : <input type="text" name="id" id="id">
		<button type="button" onclick="id_check();">중복확인</button>
		<br>
		PW : <input type="text" name="pw" id="pw" onkeyup="pw_check();">
		<br>
		PW(확인) : <input type="text" name="pw2" id="pw2" onkeyup="pw_check();">
		<p id="re"></p>
		<br>
		
		Name : <input type="text" name="name" id="name">
		<br>
		남자 : <input type="radio" name="gender" value="m" checked="checked">
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
		<input type="submit" value="체크" onclick="check();">
		<input type="submit" value="가입" onclick="submitAction();" >
	</form>
</body>
</html>