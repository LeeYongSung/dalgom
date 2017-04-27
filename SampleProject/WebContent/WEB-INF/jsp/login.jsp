<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>login</title>
</head>
<body>
	<div class="container">
	  <h2>Login</h2>
	  <form action="selectLogin" method="post">
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
	    </div>
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password">
	    </div>
	    <div class="checkbox">
	      <label><input type="checkbox" name="remember"> Remember me</label>
	    </div>
	    <button type="submit" class="btn btn-default">Submit</button>
	  </form>
	</div>
</body>
</html>