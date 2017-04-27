<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(";");
		for(var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while(c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if(c.indexOf(name)){
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays*24*60*60*1000));
		var expires = "expires=" + d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires; 
	}
</script>
</head>
<body>
<%-- 
 	<jsp:useBean id="u" class="com.java.bean.UserBean"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>
	
	<jsp:getProperty property="id" name="u"/>
	<jsp:getProperty property="pw" name="u"/>
	--%>
	<%-- EL tag 사용법 --%>
	<%--
	${u}
	${u.id}
	${u.pw}
	--%>
	<jsp:useBean id="u" class="com.java.bean.UserBean"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>
	<%!
		String key;
	%>
	<%
	HttpSession s = request.getSession();
	s.setAttribute("key", "ABCDE");
	key = s.getAttribute("key").toString(); //object 형식으로 오기 때문에 모든지 담을 수 있다.(배열 등등)
	
	Cookie[] cookie = request.getCookies();
	for(int i = 0; i < cookie.length; i++) {
		out.print(i + ") Name : " + cookie[i].getName() + ", ");
		out.print(i + ") Value : " + cookie[i].getValue() + " ");
		
	}
	%>
		<%= key %>
	
	${key}
	${u.id}
	${u.pw}
	${u.name}
	${u.gender}
	${u.year}
	${u.month}
	${u.day}
	${u.email}
	
	
</body>
</html>