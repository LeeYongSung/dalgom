<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<style>
	.user {
		float : left;
		width : 40%;
		margin-left : 5%;
		margin-bottom : 50px;
	}
	.authority {
		float : right;
		width : 40%;
		margin-right : 5%;
		margin-bottom : 50px;
		
	}
	.user_auth {
		clear : both;
		width : 90%;
		margin : 0 5%;
		height : 400px;
	}
	ul {
		margin : 0;
		padding : 0;
	}
	li {
		padding-top : 20px;
		padding-bottom : 20px;
		padding-left : 30px;
		list-style: none;
		border : 1px solid;
		border-color : lightgray;
		cursor : pointer;
	}
	li:hover {
		background-color : #c4b4ae;
	}
	li:active {
		background-color : lightgray;
	}
	.i {
		padding-left : 250px;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({type: "POST",
		url : "/google_1/devSelect.lys",
		success : function(data){
				console.log(data);
	   }
     });
});
	var Id = "";
	
	function user(type, id, authId) {
		switch (type) {
			case "U":
				$.ajax({type: "POST",
					url : "/google_1/DevAction!mapping.lys",
					data : {"userId": id},
					success : function(data){
							console.log(data);
							setMappingList(data.list3);
				   }
			     });
				Id = id;
				console.log(Id);
				break;
			default:
				console.log("user()");
				break;
		}
	}
	function auth(type, authId) {
		switch(type) {
		case "A":
			$.ajax({
				type: "POST",
				url : "/google_1/DevAction!insert.lys",
				data : {"userId" : Id, "authId" : authId},
				success : function(data) {
					console.log(data);
					setMappingList(data.list3);
				}
			});
			break;
		default:
			console.log("auth()");
			break;
		}
	}
	function setMappingList(data){
		if(data != null){
			var html = "";
			for(var i = 0; i < data.length; i++){
				html += "<tr>";
				html += "<td>" + data[i].NAME + "</td>";
				html += "<td class='i'>" + data[i].AUTH_NAME + "</td>";
				html += "<td class='i'>" + data[i].MOD_DATE + "</td>";
				html += '<td><button type="button" onclick="deletebtn(\''+data[i].ID+'\',\''+data[i].AUTH_ID+'\')">삭제</button></td>'
				html += "</tr>";
			}
			$("#mappingList").empty().html(html);
		}
	}
	function deletebtn(Id, authId) {
		console.log(Id, authId);
		$.ajax({type: "POST",
			url : "/google_1/DevAction!delete.lys",
			data : {"userId": Id,
					"authId": authId},
			success : function(data){
					console.log(data);
					if(data != null){
						setMappingList(data.mappingList);
					}
					
		   }
	     });
	}
</script>
</head>
<body>
	<section>
		<div>
			<div class="user">
			<h2>User</h2>
				<ul>
					<c:forEach items="${list}" var="list" varStatus="status">
					
						<li onclick="user('U', '${ list.ID }')" id="${ status.index }">${ list.NAME } </li>
					
					</c:forEach>
				</ul>
			</div>
			<div class="authority">
			<h2>Authority</h2>
				<ul>
					<c:forEach items="${list2}" var="list2" varStatus="status">
						<li onclick="auth('A', '${ list2.AUTH_ID }')" id="${ status.index } }">${ list2.AUTH_NAME }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="user_auth">
		<h2>User_Auth</h2>
			<table>
				<tr>
					<th>Name</th>
					<th class="i">Auth</th>
					<th class="i">date</th>
				</tr>
				<tbody id="mappingList">
					
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>