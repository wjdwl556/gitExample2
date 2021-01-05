<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
</head>
<body>
<%-- <%@ page import="java.util.HashMap" %>
<%
HashMap<String,String> map=
(HashMap<String,String>)request.getAttribute("map");
String[] fruits = {"포도","오렌지","바나나","사과"};//키값을 배열로 만듦
for(String f : fruits){
	out.println("키:"+f+"==> 값:"+map.get(f)+"<br>");
}
%> --%>

<%@ include file="../include/header.jsp" %>
<!-- EL 2가지 방식으로 처리 가능
1) ${변수.속성}
2) ${변수["속성"]}
EL에서는 기본적으로 속성에 한글을 못쓴다.
ex) ${map.포도}x  ${map["포도"]}o
 -->

${map["포도"]} <br>
${map["오렌지"]} <br>
${map["바나나"]} <br>
${map["사과"]} <br>

<!-- 모두 출력할 경우 -->
<c:forEach var="row" items="${map}">
  ${row} : ${row.key} => ${row.value} <br>

</c:forEach>

</body>
</html>