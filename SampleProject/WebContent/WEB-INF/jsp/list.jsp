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
<title>list</title>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({type: "POST",
		url : "data/BoardAction!execute",
		success : function(data){
			console.log(data);
			var list = data.list;
			var html = "";
			if(list != null){
				for(var i = 0; i < list.length; i++){
					html += '<tr class="list">';
					html += '<td class="text-left">' + (i + 1) + '</td>';
					html += '<td class="text-center">' + list[i].TITLE + '</td>';
					html += '<td class="text-center">' + list[i].CONTENT + '</td>';
					html += '<td class="text-center">' + list[i].REG_DATE + '</td>';
					html += '</tr>';
				}
				$("tbody").empty().html(html);
				
				$(".list").on("click", function(){
					var index = $(".list").index($(this));
					console.log(list[index].BOARD_NO);
					location.href = "boardDetail?boardNo=" + list[index].BOARD_NO;
				});
			}else{
				html += '<tr>';
				html += '<td class="text-center" colspan="4">조회된 데이터가 없습니다.</td>';
				html += '</tr>';
				$("tbody").empty().html(html);
			}
	   },error : function(data){
		   console.log(data);
	   }
     });
	
	$("#edit").on("click", function(){
		$.ajax({type: "POST",
			url : "data/LoginAction!detailUser",
			success : function(data){
				console.log(data, data.userMap);
				$("#userDesc").val(data.userMap.USER_DESC);
				$("form").removeClass("none");
				$("#edit").addClass("none");
			}
		});
	});
});
</script>
<style type="text/css">
.none {
	display: none;
}
.full {
	width: 100%;
}
</style>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">SampleProject</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> ${userNm}</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  <div class="row">
		<div class="col-sm-12">
	  	<h2>리스트</h2>
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th class="text-left">No</th>
		        <th class="text-left">Title</th>
		        <th class="text-center">Content</th>
		        <th class="text-center">ModDate</th>
		      </tr>
		    </thead>
		    <tbody></tbody>
		  </table>
	  </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">사용자 정보</h4>
        </div>
        <div class="modal-body">
          <p>email : ${email}</p>
          <p>Name : ${userNm}</p>
          <form action="" method="post" class="none">
	        <div class="form-group">
		      <label for="pwd">Desc:</label>
		      <input type="text" class="form-control" name="userDesc" id="userDesc" placeholder="Enter desc">
	     	  <button type="submit" class="btn btn-default full">수정</button>
		    </div>
	      </form>
	      <button type="button" class="btn btn-default" id="edit">편집</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>