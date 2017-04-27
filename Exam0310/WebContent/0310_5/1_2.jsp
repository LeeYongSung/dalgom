<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String q;
		String jo;
		String jo1;
		String jo2;
		String str;
		String eq = "";
		
		public String team() {
			String a = "";
			if("1조".equals(q)) {
				a = "1조";
			} else if("2조".equals(q)) {
				a = "2조";
			} else if("3조".equals(q)) {
				a = "3조";
			} else if("4조".equals(q)) {
				a = "4조";
			} else if("5조".equals(q)) {
				a = "5조";
			}
			return a;
		}
	%>
	<%
		q = request.getParameter("q");
		jo = request.getParameter("glass");
		jo1 = request.getParameter("sex");
		jo2 = request.getParameter("height");
		
		str = team();
		%><p><%= str %></p><%
		
		if("1조".equals(team())) {
			if("Y".equals(jo)) {
				if("male".equals(jo1)){
					if("170up".equals(jo2)){
						eq = "a";
					} else {
						eq = "없음";
					}
				} else {
					eq = "없음";
				}
			} else {
				eq = "이용성";
			}
		} else if ("2조".equals(team())){
			if("Y".equals(jo)) {
				if("male".equals(jo1)){
					if("170up".equals(jo2)){
						eq = "오동규";
					} else {
						eq = "없음";
					}
				} else {
					eq = "없음";
				}
			} else {
				eq = "없음";
			}
		} else if ("3조".equals(team())){
			if("Y".equals(jo)) {
				if("male".equals(jo1)){
					if("170up".equals(jo2)){
						eq = "이진형";
					} else {
						eq = "안성진";
					}
				} else {
					eq = "없음";
				}
			} else {
				if("male".equals(jo1)) {
					if("170up".equals(jo2)) {
						eq = "최형윤";
					} else {
						eq = "없음";
					}
				} else {
					eq = "없음";
				}
			}
		} else if ("4조".equals(team())){
			if("Y".equals(jo)) {
				if("male".equals(jo1)){
					if("170up".equals(jo2)){
						eq = "황현우";
					} else {
						eq = "없음";
					}
				} else {
					eq = "김서희";
				}
			} else {
				eq = "윤은정";
			}
		} else if ("5조".equals(team())){
			if("Y".equals(jo)) {
				if("male".equals(jo1)){
					if("170up".equals(jo2)){
						eq = "없음";
					} else {
						eq = "이민욱, 김민재";
					}
				} else {
					eq = "없음";
				}
			} else {
				eq = "이은혜";
			}
		} 
		response.sendRedirect(eq);
		
	 %>
			
	<p> <%= eq %></p>
</body>
</html>