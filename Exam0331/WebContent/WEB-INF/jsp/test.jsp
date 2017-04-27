<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		$("#kmj").click(function(){
			alert("김민재");
		});
	});
	function call_event(key, no){
		var data = {};
		var url = "";
		if(key == 2){
			data = {
					"no": no
				    };
			url = "/Exam0331/TestAction!delete.kkb";	
		}else if(key == 3){
			data = {
				    "title": document.getElementById("i_title").value, 
				    "content" : document.getElementById("i_content").value
				    };
			url = "/Exam0331/TestAction!insert.kkb";
		}else if(key == 4){
			data = {
					"no": document.getElementById("upNo").value,
					"title": document.getElementById("upTitle").value, 
				    "content" : document.getElementById("upContent").value
				    };
			url = "/Exam0331/TestAction!update.kkb";
		}
		console.log(data);
		$.ajax({type: "POST",
				url : url,
				data : data,
				success : function(data){
					console.log(data);
			        	var result = data;
						if(result.text == "S"){
							alert("성공!");
// 							success_event();
						}else{
							alert("실패!");
						}
			   }
	         });
	}
	function success_event(){
		location.href = "/Exam0331/TestAction!execute.kkb";
	}
	function up_event(no, title, content){
		document.getElementById("frU").style.display = "";
		document.getElementById("upNo").value = no;
		document.getElementById("upTitle").value = title;
		document.getElementById("upContent").value = content;
	}
</script>
</head>
<body>
	<h1 id="kmj" style="cursor: pointer;">Test</h1>
	<s:property value="text"/>
	
<table style="text-align: center; width: 100%;">
	  <tr>
	  	<th>TITLE</th>
	  	<th>CONTENT</th>
	  	<th>CNT</th>
	  	<th>DEL_YN</th>
	  	<th>REG_USER</th>
	  	<th>삭제</th>
	  </tr>
	<s:iterator value="list">
	  <tr>
		<td><s:property value="TITLE"/></td>
		<td><s:property value="CONTENT"/></td>
		<td><s:property value="CNT"/></td>
		<td><s:property value="DEL_YN"/></td>
		<td><s:property value="REG_USER"/></td>
		<td><button type="button" onclick="call_event(2, '<s:property value="NO"/>')">삭제</button></td>
		<td><button type="button" onclick="up_event('<s:property value="NO"/>','<s:property value="TITLE"/>','<s:property value="CONTENT"/>')">수정</button></td>
	  </tr>
	</s:iterator>
</table>
<hr>
<div>
	제목 : <input type="text" name="title" id="i_title">
	내용 : <input type="text" name="content" id="i_content">
	<button type="button" onclick="call_event(3)">입력</button>
</div>
<hr>
<div style="display:none;" id="frU">
	<input type="hidden" name="no" id="upNo">
	제목 : <input type="text" id="upTitle" name="title">
	내용 : <input type="text" id="upContent" name="content">
	<button type="button" onclick="call_event(4)">수정</button>
</div>
</body>
</html>