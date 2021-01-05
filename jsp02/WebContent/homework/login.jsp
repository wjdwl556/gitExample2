<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/login_oracle_secret.do",
			data: param
			
		});
	});
});
</script>
</head>
<body>
<h1 align="center">로그인</h1>
<table align="center">
  <tr>
	<td>
		아이디 : <input id="userid"> <br>
	</td>
  </tr>
  <tr> 
	<td>
		비밀번호 : <input type="password" id="passwd">
	</td>
  </tr>
  <tr> 
	<td>
		<button id="btnLogin">로그인</button><a href="join.jsp"><button>회원가입</button></a>
  	</td>
  </tr>
</table>
<div id="result"></div>
</body>
</html>