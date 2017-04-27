<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btlogin").click(function(){
			console.log($("#email").val());
			$.ajax({ type: "POST",
				url: "/Exam0410/LoginAction!execute.lys",
				success: function(data){
					console.log(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<h3>로그인</h3>
	<input type="text" id="email">
	<button type="button" id="btlogin">로그인</button>
</body>
</html>