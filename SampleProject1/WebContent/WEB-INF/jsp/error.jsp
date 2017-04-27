<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Error</title>
</head>
<body>
    <div class="container text-center">
	  <h3>Login Error:</h3>
      <p><s:property value="message"/></p>
      <form action="guestLogin" method="post">
      	<button type="submit" class="btn btn-default">비회원 접속</button>
      </form>
      <form action="insertUser" method="post">
      	<input type="hidden" name="email" value="${ email }">
      	<input type="hidden" name="pwd" value="${ pwd }">
      	<button type="submit" class="btn btn-default">회원 가입</button>
      </form>
      <form action="login" method="post">
      	<button type="submit" class="btn btn-default">로그인</button>
      </form>
	</div>
</body>
</html>