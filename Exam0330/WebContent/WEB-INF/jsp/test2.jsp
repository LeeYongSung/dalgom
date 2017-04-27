<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
<script type="text/javascript">
	function del(no){
		document.getElementById("delNo").value = no;
		document.getElementById("frD").submit();
	}
	function up(no, name, desc, delyn){
		document.getElementById("frU").style.display = "";
		document.getElementById("upNo").value = no;
		document.getElementById("upName").value = name;
		document.getElementById("upDesc").value = desc;
		document.getElementById("upDelYn").value = delyn;
	}
</script>
</head>
<body>
	<table>
		<s:iterator value="data">
		  <tr>
				<td><s:property value="No"/></td>
				<td><s:property value="Name"/></td>
				<td><s:property value="Desc"/></td>
				<td><s:property value="DelYn"/></td>
				<td><button type="button" onclick="del('<s:property value="No"/>')">삭제</button></td>
				<td><button type="button" onclick="up('<s:property value="No"/>','<s:property value="Name"/>','<s:property value="Desc"/>','<s:property value="DelYn"/>')">수정</button></td>
			</tr>
		</s:iterator>	
	</table>
	<hr>
	<s:form namespace="test" action="TestAction!insert" method="post" theme="simple">
		No : <s:textfield name="No" /><br>
		Name : <s:textfield name="Name" /><br>
		Desc : <s:textfield name="Desc" /><br>
		DelYn : <s:textfield name="DelYn" /><br>
		<s:submit value="입력"/>
	</s:form>
	<s:form id="frD" namespace="test" action="TestAction!delete" method="post" theme="simple">
		<s:hidden name="No" id="delNo"/>
	</s:form>
	<hr>
	<s:form id="frU" namespace="test" action="TestAction!update" method="post" theme="simple" style="display: none;">
		<s:hidden name="No" id="upNo"/>
		Name : <s:textfield name="Name" id="upName"/><br>
		Desc : <s:textfield name="Desc" id="upDesc"/><br>
		DelYn : <s:textfield name="DelYn" id="upDelYn"/><br>
		<s:submit value="수정"/>
	</s:form>
</body>
</html>
