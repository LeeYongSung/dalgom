<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="a" value="1"/>
	a : <c:out value="${a}"/>
	<hr>
	<c:remove var="a"/>
	a : <c:out value="${a}"/>
	<hr>
	<c:catch var="error">
		<%= 2/0 %>
	</c:catch>
	<c:out value="${ error }"/>
	<hr>
	<c:if test="${1+2 != 3}">
		1 + 2 != 3
	</c:if>
	<c:forEach var="i" begin="0" end="30" step="3">
		${ i } <br>
	</c:forEach>
	<hr>
	<c:set var="b" value="10"/>
	<c:choose>
		<c:when test="${b / 2 == 5}">${b} / 2 = 5</c:when>
		<c:when test="${b + 2 == 12}">${b} + 2 = 12</c:when>
		<c:when test="${b - 2 == 8}">${b} - 2 = 8</c:when>
		<c:otherwise>비교 외 값</c:otherwise>
	</c:choose>
</body>
</html>