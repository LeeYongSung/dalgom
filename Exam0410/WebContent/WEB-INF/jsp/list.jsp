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
<title>리스트</title>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type : "POST",
			url : "/Exam0410/BoardAction!execute.lys",
			success : function(data){
				console.log(data);
				var list = data.board;
				setList(list);
				console.log(list);
				$(".list").click(function(){
					var index = $(".list").index($(this));
					console.log(list[index].NO);
					location.href = "detail.lys?no=" + list[index].NO;
					
					
				});	
			}
		});
		
	});
	
function setList(data) {
	var html = "";
	for(var i = 0; i < data.length; i++) {
		html += '<tr class="list">';
		html += '<td class="text-left">'+ data[i].NO +'</td>';
		html += '<td class="text-center">'+ data[i].TITLE +'</td>';
		html += '<td class="text-center">'+ data[i].CONTENT +'</td>';
		html += '<td class="text-center">'+ data[i].REG_DATE +'</td><br>';
		html += '</tr>';
	}
	$("tbody").empty().html(html);
}

</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
	  	<h2>리스트</h2>
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th class="text-left">No</th>
		        <th class="text-center">Title</th>
		        <th class="text-center">Content</th>
		        <th class="text-center">ModDate</th>
		      </tr>
		    </thead>
		    <tbody>
			    <tr>
					<td class="text-left">번호</td>
					<td class="text-center">제목</td>
					<td class="text-center">내용</td>
					<td class="text-center">수정일자</td>
				</tr>
		    </tbody>
		  </table>
	  </div>
	</div>
</div>
</body>
</html>