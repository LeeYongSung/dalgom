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
<title>상세</title>
<script type="text/javascript">
var email = "${email}";
var regUser = "${DataMap.REG_ID}";
var boardNo = "${DataMap.BOARD_NO}";
$(document).ready(function(){
	if(email == regUser){
		$("button").eq(0).removeClass("none");
		$("button").eq(1).removeClass("none");
	}
	$("button").on("click", function(){
		callBack($("button").index($(this)));
	});
	var callBack = function(index){
		switch (index) {
		case 0:
			data = {"boardNo": boardNo};
			console.log("delete", data);
			$.ajax({type: "POST",
				url : "data/BoardAction!delete",
				data : data,
				success : function(data){
					console.log(data);
					if(data.cnt < 1){
						alert("오류 발생하였습니다.");
					}else {
						alert("정상 처리 되었습니다.");
						location.href = "board";
					}
				}
			});
			break;
		case 1:
			$(".col-sm-12").eq(2).removeClass("none");
			$(".col-sm-12").eq(3).addClass("none");
			$(".col-sm-12").eq(1).removeClass("none");
			$("#title_edit").val($("#title").text());
			$("#content_edit").val($("#content").text());
			$(".col-sm-12").eq(0).addClass("none");
			$("button").eq(0).addClass("none");
			$("button").eq(1).addClass("none");
			$("button").eq(2).removeClass("none");
			break;
		case 2:
			data = {"boardNo": boardNo, "email": email, "title": $("#title_edit").val(), "content": $("#content_edit").val()};
			console.log("update", data);
			$.ajax({type: "POST",
				url : "data/BoardAction!update",
				data : data,
				success : function(data){
					console.log(data);
					if(data.cnt < 1){
						alert("오류 발생하였습니다.");
					}else {
						alert("정상 처리 되었습니다.");
						location.href = "boardDetail?boardNo=" + boardNo;
					}
				}
			});
			break;
		case 3:
			location.href = "board";
			break;
		default:
			console.log("default");
			break;
		}
	}
});
</script>
<style type="text/css">
.none {
	display: none;
}
.edit {
	width: 60px;
}
</style>
</head>
<body>
<div class="container">
  <div class="col-sm-12">
	<h3 id="title">${DataMap.TITLE}</h3>
 	<p id="content">${DataMap.CONTENT}</p>
  </div>
  <div class="col-sm-12 none">
  		<label>Title</label><br>
  		<input type="text" id="title_edit" value="${DataMap.TITLE}"><br>
 		<label>Content</label><br>
 		<input type="text" id="content_edit" value="${DataMap.CONTENT}">
  </div>
  <div class="col-sm-12">
 	<button type="button" class="none">삭제</button>
 	<button type="button" class="none">수정</button>
 	<button type="button" class="none">적용</button>
 	<button type="button">목록</button>
  </div>
</div>
</body>
</html>