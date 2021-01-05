<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<style type="text/css">
*{margin: 0; padding: 0;}
 
/* 화면에 너무 붙어 있어서...  */
body{
    padding: 30px;
    background-color: #f3f1e9;
}
 
/* header 영역  */
header{ padding: 5px;}
 
header a{text-decoration: none; color: #333333;}

h5{
	color:gray;
	border-bottom:1px solid gray;
	padding:10px;
}
table{
	margin:auto;
}
.layout{
	font-family: "배달의민족 주아";
	font-size:20px;
}
.photo{
	width:auto;
	float: left;
	
}
footer{
    clear: both;
    background-color: #333333;
    color: white;
    text-align: center;
    padding: 1em 0px;
}
ul.li{
	display: none;
}

</style>
<script type="text/javascript">
function updateMemo(){
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	if(writer==""){
		alert("이름을 입력하세요.");
		$("#writer").focus();
		return;
	}
	if(memo==""){
		alert("메모를 입력하세요.");
		$("#memo").focus();
		return;
	}
	document.form1.action="${path}/memo_servlet/update.do";
	document.form1.submit();
}

function deleteMemo(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/memo_servlet/delete.do";
		document.form1.submit();
	}
	
}


</script>
<header>  
 <h1 style="text-align: center;">
            <img src="../homework/images/t.jpg" width="200" height="200">
            <a href="main2.jsp" ">화개 장터</a>
     </h1>
     </header>
</head>
     <h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다. <br>
<body>
<h2 style="text-align: center;">메모 수정</h2>
<form name="form1" id="form1" method="post">
<table border="1" width="550px">
  <tr>
    <td>이름 </td>
    <td><input name="writer" id="writer" value="${dto.writer}"> </td>
  </tr>
  <tr>
    <td>메모 </td>
    <td><input name="memo" id="memo" size="50" value="${dto.memo}"> </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="hidden" name="idx" id="idx" value="${dto.idx}">
      <input type="button" value="수정" onclick="updateMemo()">
      <input type="button" value="삭제" onclick="deleteMemo()">
    </td>
  </tr>
</table>
</form>
<footer>
        Copyright & copy; 2019
    </footer>

</body>
</html>