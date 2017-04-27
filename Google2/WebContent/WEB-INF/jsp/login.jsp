<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Google Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript">
	var googleUser = {};
	function startApp(){
		gapi.load('auth2', function(){
			auth2 = gapi.auth2.init({
				client_id: '480904389355-sob3ivqotm9sco1v48en2pdboa8v60oa.apps.googleusercontent.com',
				cookiepolicy: 'http://192.168.0.122:8080'
			});
			attachSignin(document.getElementById("google"));
		});
	}
	function attachSignin(element){
		auth2.attachClickHandler(element, {},
		   function(googleUser){
				console.log("googleUser", googleUser.getBasicProfile());
				var source = googleUser.getBasicProfile();
				var data = {
					"id": source.Eea,
					"img": source.Paa,
					"email": source.U3,
					"name": source.ig
				};
				console.log("data", data);
				$.ajax({type: "POST",
					url : "/Google2/google.kkb",
					data : data,
					success : function(data){
							console.log("success", data);
				   }
		         });
		}, function(error){
				console.log(error);
		});
	}
	startApp();
</script>
</head>
<body>
	<button type="button" id="google">로그인</button>
</body>
</html>