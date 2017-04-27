<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		String Id = "lys";
		String Pw = "1234";
		String rs = "";
	%>
	<%
		if(request.getParameter("id").toString().equals(Id)) {
			if(request.getParameter("pw").toString().equals(Pw)) {
				rs = "Y";
			} else {
				rs = "N";
			}
		} else {
			rs = "N";
		}
		response.sendRedirect("C.jsp?rs=" + rs);
	
	%>
</body>
</html>