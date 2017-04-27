<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:forward page="test2.jsp"></jsp:forward> --%>
	<%-- <jsp:include page="test2.jsp"></jsp:include> --%>
	<jsp:forward page="test2.jsp">
		<jsp:param value="1234" name="val"/>
	</jsp:forward>
	<h1>forward 화면</h1>
</body>
</html>