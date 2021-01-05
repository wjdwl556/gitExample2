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
Cookie[] cookies = request.getCookies();
if(cookies !=null){
	for(int i=0; i<cookies.length; i++){
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
}

%>
쿠키가 삭제되었습니다.
<a href="useCookie2.jsp">쿠키 확인</a>
</body>
</html>