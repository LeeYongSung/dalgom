<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	function call_event(key, no){
		var data = {};
		var url = "";
		switch(key){
			case 1: 
				url = "/Exam0331/TestAction!execute.kkb";
				ajaxCall(url, data, key);
				break;
			case 2: 
				data = {
						"no": no
					    };
				url = "/Exam0331/TestAction!delete.kkb";
				ajaxCall(url, data, key);
				break;
			case 3: 
				data = {
					    "title": document.getElementById("i_title").value, 
					    "content" : document.getElementById("i_content").value
					    };
				url = "/Exam0331/TestAction!insert.kkb";
				ajaxCall(url, data, key);
				break;
			case 4: 
				data = {
						"no": document.getElementById("upNo").value,
						"title": document.getElementById("upTitle").value, 
					    "content" : document.getElementById("upContent").value
					    };
				url = "/Exam0331/TestAction!update.kkb";
				document.getElementById("frU").style.display = "none";
				ajaxCall(url, data, key);
				break;
			default :
				alert("잘 못된 명령입니다.");
				break;
		}
	}
	function ajaxCall(url, data, key){
		$.ajax({type: "POST",
			url : url,
			data : data,
			success : function(data){
					if(data.text == "S"){
						if(key != 1){
							alert("성공!");
						}
						setList(data.list);
					}else{
						alert("실패!");
					}
		   }
         });
	}
	function setList(data){
		var html = "";
		    html += '<tr>'
			html += ' <td>TITLE</td>';
			html += ' <td>CONTENT</td>';
			html += ' <td>CNT</td>';
			html += ' <td>DEL_YN</td>';
			html += ' <td>REG_USER</td>';
			html += ' <td>delete</td>';
			html += ' <td>update</td>';
			html += '</tr>';
		
		for(var i = 0; i < data.length; i++){
		    html += '<tr>'
			html += ' <td>' + data[i].TITLE + '</td>';
			html += ' <td>' + data[i].CONTENT + '</td>';
			html += ' <td>' + data[i].CNT + '</td>';
			html += ' <td>' + data[i].DEL_YN + '</td>';
			html += ' <td>' + data[i].REG_USER + '</td>';
			html += ' <td><button type="button" onclick="call_event(2, \'' + data[i].NO + '\')">삭제</button></td>';
			html += ' <td><button type="button" onclick="up_event(\'' + data[i].NO + '\',\'' + data[i].TITLE + '\',\'' + data[i].CONTENT + '\')">수정</button></td>';
			html += '</tr>';
		}
		$("#table").html(html);
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
	$( document ).ready(function() {
		call_event(1);
	});
</script>
</head>
<body>
	<h1>Test</h1>
	<table style="text-align: center; width: 100%;" id="table"></table>
	<hr>
	<div>
		제목 : <input type="text" name="title" id="i_title">
		내용 : <input type="text" name="content" id="i_content">
		<button type="button" onclick="call_event(3)">입력</button>
		<hr>
	</div>
	<div style="display:none;" id="frU">
		<input type="hidden" name="no" id="upNo">
		제목 : <input type="text" id="upTitle" name="title">
		내용 : <input type="text" id="upContent" name="content">
		<button type="button" onclick="call_event(4)">수정</button>
	</div>
</body>
</html>