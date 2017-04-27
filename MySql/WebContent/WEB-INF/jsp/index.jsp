<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MariaDB</title>
</head>
<body>
<table>
	<tr>
		<th>Table Name</th>
	</tr>
	<s:iterator value="list">
		<tr>
<%-- 			<td><s:property value="Tables_in_lys"/></td> --%>
			<td><s:property value="no"/></td>
		</tr>
 	</s:iterator>
 </table>
</body>
</html>