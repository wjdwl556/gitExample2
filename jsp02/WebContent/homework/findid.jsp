<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnfindid").click(function(){
		var param="name="+$("#name").val()
		+"&hp="+$("#hp").val();
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/findid.do",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});
</script>
</head>
<body>
이름 : 
<input id="name">
전화번호 : 
<input id="hp">
<button id="btnfindid">확인
</button>
<div id="result"></div>
</body>
</html>