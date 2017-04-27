<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
	<script>
	$(document).ready(function(){
		var chart = "";
		$.ajax({
			type : "POST",
			url : "lys/MySqlAction!execute.lys",
			success : function(data) {
				console.log(data.list);
				chart = data.list;
				console.log();
				aa();
				var data = {
						labels: [chart[0].chart_month, chart[1].chart_month, chart[2].chart_month, chart[3].chart_month, chart[4].chart_month, chart[5].chart_month
						         , chart[6].chart_month, chart[7].chart_month, chart[8].chart_month, chart[9].chart_month, chart[10].chart_month, chart[11].chart_month],
						datasets: [
							{
								label: "My First dataset",
								fillColor: "rgba(150,200,250,0.5)",
								strokeColor: "rgba(150,200,250,0.8)",
								highlightFill: "rgba(150,200,250,0.75)",
								highlightStroke: "rgba(150,200,250,1)",
								data: [chart[0].chart_score, chart[1].chart_score, chart[2].chart_score, chart[3].chart_score, chart[4].chart_score, chart[5].chart_score,
								       chart[6].chart_score, chart[7].chart_score, chart[8].chart_score, chart[9].chart_score, chart[10].chart_score, chart[11].chart_score]
							}
						]
					};
					var options = {	animation: true };
					var ctx = $('#myChart').get(0).getContext('2d');
					var myBarChart = new Chart(ctx).Bar(data, options);
			}
		});
	});
	function aa(chart) {
		var html = "";
			html += '<canvas id="myChart" width="600" height="500">';
			html += '</canvas>';
			
		$("body").empty().html(html);
	}
</script>
</head>
<body>

</body>
</html>