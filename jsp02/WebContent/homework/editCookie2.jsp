<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
</head>
<body>
<%
response.addCookie(new Cookie("hp","010-5678-9715"));
%>
번호 : ${cookie.hp.value }<br>
쿠키가 변경되었습니다. <br>
<a href="useCookie2.jsp">쿠키 확인</a>
</body>
</html>