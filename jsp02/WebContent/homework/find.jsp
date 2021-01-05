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
nav{margin-top: 10px; margin-bottom: 20px;}
 
nav ul{
    list-style: none;
    border-top: 1px solid red;
    border-bottom: 1px solid red;
    text-align: center;
}
 
nav ul li{
    display: inline;
    letter-spacing: .3em;
    margin-left: 2em;
}
 
nav ul li a{
    text-decoration: none;
    color: black;
    line-height: 3em;
    text-transform: uppercase;
}
 
nav ul li a:hover{ text-decoration: underline;}

aside.ad1{width: 200px; height: 496px; background: skyblue; float: right;
color: purple; margin:10px auto
}
aside.ad2{width: 200px; height: 496px; background: skyblue; float: left;
color: purple; margin:10px auto
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do"
	});
});
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp";
	});
});

//클릭한 페이지로 이동
function list(page){
	location.href
		="${path}/board_servlet/list.do?curPage="+page;
}
</script>
</head>
<body>
<header>  
  <h1 style="text-align: center;">
             <a href="main2.jsp" ><img src="images/login_logo.png" width="200" height="200">
           </a>
     </h1>
     </header>
        <h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다. <br>
	<button type="button" id="btnLogout">로그아웃</button><br>
	  <nav>
        <ul>
        	<li><a href="main2.jsp">홈</a></li>
            <li><a href="chul.jsp">출석체크</a></li>
            <li><a href="cc.jsp">회사 소개</a></li>
            <li><a href="find.jsp">물건 찾기</a></li><
             <li><a href="mypage.jsp">마이페이지</a></li>
        </ul>
    </nav>
    <aside class="ad1">
<h2>우측광고</h2>
</aside>
<aside class="ad2">
<h2>좌측 광고</h2>
</aside>
<form name="form1" method="post" 
action="${path}/board_servlet/search.do" style="text-align: center;">
<select name="search_option">
  <option value="writer">이름 </option>
  <option value="subject">제목 </option>
  <option value="content">내용 </option>
  <option value="all">이름+제목+내용 </option>
</select>
<input name="keyword" height="100"; width="100";>
<button id="btnSearch">검색</button>
</form>
<img alt="" src="images/siz.jpg" style="display: block; margin: 0px auto;">




 <footer>
       ⓒ 2020 화개장터
    </footer>

</body>
</html>