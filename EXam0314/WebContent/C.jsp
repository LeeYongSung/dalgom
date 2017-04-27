<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		width : 80%;
		margin: 0 auto;
		padding: 0 auto;
	}
	h3, p {
		text-align: center;
		margin: 8px 0;
	}
	label {
		width : 30px;
		display: inline-block;
		margin: 5px 0;
	}
	input.i {
		width : calc(100% - 40px);
		margin: 5px 0;
		float: right;
	}
	input.s {
		width: 100%;
		cursor: pointer;
	}
</style>
</head>
<body>
	<%
		String type, id, pw, nm, flag, query;	
	%>
	<div>
		<%
			type = request.getParameter("type");
			flag = request.getParameter("flag");
			
			%>
				<h3>회원가입</h3>
			<%
			if("A".equals(type)) {
				flag = request.getParameter("flag");
				if("Y".equals(flag)) {
					%>
						<p>성공</p>
					<%
				} else if("N".equals(flag)) {
					%>
						<p>실패</p>
					<%
					
				}
			} else if("B".equals(type)) {
				id = request.getParameter("id");
				pw = request.getParameter("pw");
				//nm = request.getParameter("nm");
				nm = session.getAttribute("nm").toString();
				%>
					<h3>사용자정보</h3>
					<label>ID</label><input type="text" name="id" id="id" class="i" value="<%= id%>">
					<label>PW</label><input type="text" name="pw" id="pw" class="i" value="<%= pw%>">
					<label>NM</label><input type="text" name="nm" id="nm" class="i" value="<%= nm%>">
				<%
			}
		%>
	</div>
</body>
</html>