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
<%@ page import="java.net.URLEncoder" %>
<%
Cookie cookie=new Cookie("id", "kim");
Cookie cookie2=new Cookie("pwd", "1234");
Cookie cookie3=new Cookie("name", "김철수");
Cookie cookie4=new Cookie("hp", "010-1234-5678");
Cookie cookie5=new Cookie("addr", "서울강동구천호동");
Cookie cookie6=new Cookie("com", "(주)미래능력");
Cookie cookie7=new Cookie("date", "2020-10-14");
Cookie cookie8=new Cookie("age", "20");

response.addCookie(cookie);
response.addCookie(cookie2);
response.addCookie(cookie3);
response.addCookie(cookie4);
response.addCookie(cookie5);
response.addCookie(cookie6);
response.addCookie(cookie7);
response.addCookie(cookie8);
%>
쿠키가 생성되었습니다. <br>
<a href="useCookie2.jsp">쿠키 확인</a>
</body>
</html>