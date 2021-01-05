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
Cookie[] cookies=request.getCookies();
if(cookies !=null){
	for(int i=0; i<cookies.length; i++){
		out.println("쿠키이름: "+cookies[i].getName());
		out.println(", 쿠키값: "+cookies[i].getValue()+"<br>");
	}
}
%>
아이디 : ${cookie.id.value}<br>
비번 : ${cookie.pwd.value}<br>
이름 : ${cookie.name.value}<br>
번호 : ${cookie.hp.value}<br>
주소 : ${cookie.addr.value}<br>
회사 : ${cookie.com.value}<br>
입사일 : ${cookie.date.value}<br>
나이 : ${cookie.age.value}<br>

<a href="deleteCookie2.jsp">쿠키 삭제</a>
<a href="editCookie2.jsp">쿠키 변경</a>
</body>
</html>