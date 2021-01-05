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
</style>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do"
	});
});
function gb_search(){
	document.form1.action="${path}/guestbook_servlet/list.do";
	document.form1.submit();
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
            <li><a href="cc.jsp">회사 소개</a></li><
            <li><a href="find.jsp">물건 찾기</a></li>
            <li><a href="mypage.jsp">마이페이지</a></li>
        </ul>
    </nav>

<h5>회사 소개</h5><br>
	<div class="layout" style="float: left;">

	<img class='photo' src="images/t2.jpg" >

		<table>
			<tbody>
			<tr>
				<td></td>
			<td>
				<ul style="margin: 30px 30px;">
					<li>회사명 : 화개장터</li>
					<li>회사 생일 : 2020 11월 09일 설립</li>
					<li>회사의 주 내용 : 각자의 물건을 물물 교환하는 형식</li>
					<li>회사의 목표 : 삭막해진 세상에서 서로의 물건을 보여주며 필요없는 물건을 버리지 않고 새로운 물건으로 바꿔주는 친환경적이고 인간미 넘치는 세상을 만들고 싶다.</li>
					<li>회사의 사훈 : 사랑 평화 행복</li>
					<li>회사 : 화이팅</li>
				</ul>
			</td>
			
			</tr>
			</tbody>
		</table>
	</div>
	<footer>
        Copyright & copy; 2020
    </footer>
</body>
</html>