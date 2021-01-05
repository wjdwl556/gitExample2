<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do";
	});
});
$(function(){//페이지 로딩이 끝나면 자동으로 실행되는 코드
	list();//아래 list()호출	
	$("#btnSave").click(function(){
		var userid=$("#userid").val();
		var name=$("#name").val();
		var passwd=$("#passwd").val();
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if(name==""){
			alert("이름을 입력하세요.");
			$("#name").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		insert();
	});
});

function insert(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&hp="+$("#hp").val();
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/join.do",
		data: param,
		success: function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
}
function list(){
	var userid3 = $("#listuserid").val();
	//회원 목록을 div에 출력, 백그라운드로 실행
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/view.do?userid="+userid3,
		success: function(result){
			console.log(result);//F12 consol에서 응답text 확인
			$("#memberList").html(result);
		}
	});
}
</script>
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
aside.ad1{width: 200px; height: 496px; background: skyblue; float: right;
color: purple; margin:10px auto
}
aside.ad2{width: 200px; height: 496px; background: skyblue; float: left;
color: purple; margin:10px auto
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
</head>
<body>
<header>  
 <h1 style="text-align: center;">
            <img src="images/login_logo.png" width="200" height="200">
            <a href="index.html" ></a>
     </h1>
<%-- <%=session.getAttribute("message") %> --%>
<h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다.  <br>
<input type="hidden" id="listuserid" value="${sessionScope.userid}">
<button type="button" id="btnLogout">로그아웃</button>
     </header>
      <nav>
        <ul>
            <li><a href="main2.jsp">홈</a></li>
            <li><a href="chul.jsp">출석체크</a></li>
            <li><a href="cc.jsp">회사 소개</a></li>
            <li><a href="find.jsp">물건 찾기</a></li>
            <li><a href="mypage.jsp">마이페이지</a></li><
        </ul>
    </nav>
        <aside class="ad1">
<h2>우측 광고</h2>
</aside>
<aside class="ad2">
<h2>좌측 광고</h2>
</aside>
    <h2 style="text-align: center;">내정보</h2>

    <div id="memberList"></div>
     
     
 <footer>
       ⓒ 2020 화개장터
    </footer>
</body>
</html>