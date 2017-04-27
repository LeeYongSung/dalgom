<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String key;
%>
<%
	key = request.getParameter("key");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A</title>
<style type="text/css">
	div {width: 80%;margin: 0 auto;padding: 0 auto;}
	h3 {text-align: center;margin: 8px 0;}
	label {width: 30px;display: inline-block;margin: 5px 0;}
	input.i {width: calc(100% - 40px);margin: 5px 0;float: right;}
	input.s {width: 100%;cursor: pointer;}
</style>
<script type="text/javascript">
	function load(){
		if("<%= key%>" == "e"){
			alert("잘못된 주소 입력입니다.");
		}else if("<%= key%>" == "s"){
			alert("사용자가 없습니다.");
		}else if("<%= key%>" == "id"){
			alert("아이디가 잘 못 되었습니다.");
		}else if("<%= key%>" == "pw"){
			alert("비밀번호가 잘 못 되었습니다.");
		}else if("<%= key%>" == "ip"){
			alert("아이디 및 비밀번호가 잘 못 되었습니다.");
		}
	}
	function check(type){
		var id, pw, nm;
		var fr = document.getElementById("fr");
		
		if(type == "A"){
			id = document.getElementById("idA").value;
			pw = document.getElementById("pwA").value;
			nm = document.getElementById("nm").value;
		}else if(type == "B"){
			id = document.getElementById("idB").value;
			pw = document.getElementById("pwB").value;
		}else {
			return false;
		}
		
		if(id == ""){
			alert("아이디를 입력해주세요.");
			reset();
			return false;
		}
		
		if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			reset();
			return false;
		}
		
		if(type == "A"){
			if(nm == ""){
				alert("이름을 입력해주세요.");
				reset();
				return false;
			}
		}
		
		document.getElementById("id").value = id;
		document.getElementById("pw").value = pw;
		document.getElementById("type").value = type;
		
		fr.submit();
		
	}
	function reset(){
		document.getElementById("idA").value = "";
		document.getElementById("pwA").value = "";
		document.getElementById("nm").value = "";
		
		document.getElementById("idB").value = "";
		document.getElementById("pwB").value = "";
		
		document.getElementById("type").value = "";
		document.getElementById("id").value = "";
		document.getElementById("pw").value = "";
	}
</script>
</head>
<body onload="load();">
<div>
	<form id="fr" action="b.jsp" onsubmit="return false;" method="post">
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="pw" id="pw">
		<input type="hidden" name="type" id="type">
		<h3>회원가입</h3>
		<label>ID</label><input type="text" name="idA" id="idA" class="i">
		<label>PW</label><input type="text" name="pwA" id="pwA" class="i">
		<label>NM</label><input type="text" name="nm" id="nm" class="i">
		<input type="submit" value="Add" onclick="check('A');" class="s">
		<hr>
		<h3>로그인</h3>
		<label>ID</label><input type="text" name="idB" id="idB" class="i">
		<label>PW</label><input type="text" name="pwB" id="pwB" class="i">
		<input type="submit" value="Apply" onclick="check('B');" class="s">
	</form>
</div>
</body>
</html>




