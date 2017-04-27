<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>상세</title>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type : "POST",
			url : "/Exam0410/BoardAction!execute.lys",
			success : function(data){
				console.log(data);
			}
		});
	});
</script>
</head>
<body>
<div class="container">
  <div class="col-sm-12">
	<h3>제목</h3>
	<h4></h4>
 	<p>내용</p>
 	<div></div>
 	<form action="" onsubmit="return false;" method="post">
 		<button type="button">삭제</button>
 		<button type="button">수정</button>
 		<button type="button">목록</button>
 	</form>  
  </div>
</div>
</body>
</html>