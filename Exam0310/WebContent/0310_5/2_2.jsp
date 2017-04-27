<%@include file="2_3.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int me = Integer.parseInt(request.getParameter("a"));
	int com = (int)(Math.random()*3)+1;
	
	String result = null;
	int rst =me -com + 3;
	if(me==com){
		result = "비김";
	}else if(rst%3==1){
		result = "이겼습니다";
	}else if(rst%3==2){
		result = "졌습니다";
	}
%>
<%!
public static String whatMethod(int key){
	String c = "";
	switch(key){
	case 1 : c = "가위";
	case 2 : c = "바위";
	case 3 : c =  "보";
	default : c =  "에러";
	}
	
	return c;
}
%> 
<%!
public static String whatMethodOut(JspWriter out,int key) throws Exception{
	String b = "";
	switch(key){
	case 1 : b = "가위"; break;
	case 2 : b = "바위"; break;
	case 3 : b = "보";  break;
	default : b = "에러";  break;
	}
	
	return b;
}
%> 
<%!
public static String resultOut(JspWriter out,int me, int com) throws Exception{
	int rst =me -com + 3;
	String a = "";
	if(me==com){
		a = "비겼습니다";
	}else if(rst%3==1){
		a = "이겼습니다";
	}else if(rst%3==2){
		a = "졌습니다";
	}
	
	return a;
}
%> 
<%
	response.sendRedirect(resultOut(out, me, com));
	response.sendRedirect(whatMethodOut(out, me));
	response.sendRedirect(whatMethod(me));
	response.sendRedirect(result);
%>

<%-- 
<h1>
me : <%=whatMethod(me)%><br/>
me 메서드이용 : <% whatMethodOut(out, me);%><br/>
com :  <%
	switch(com){
	case 1 : out.println("가위");break;
	case 2 : out.println("바위");break;
	case 3 : out.println("보");break;
	default : out.println("에러"); break;
	}
	%><br/>
result : <%= result %><br/>
결과 메서드이용 : <% resultOut(out,me,com); %>

</h1>
--%>
</body>
</html>