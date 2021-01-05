<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>
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
<script type="text/javascript">
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		list();
	});
});

function insert(){
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	var param="writer="+writer+"&memo="+memo;
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/insert.do",
		data: param,
		success: function(){
			list();
			$("#memo").val("");
		}
	});
}

function list(){
	//검색옵션과 검색할 키워드를 전달
	var param="searchkey="+$("#searchkey").val()
		+"&search="+$("#search").val();
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/list.do",
		data: param,
		success: function(result){
			$("#result").html(result);
		}
	});
}
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do"
	});
});
function showClock()
{
    var currentDate=new Date();
    var divClock=document.getElementById("divClock");
    var apm=currentDate.getHours();
    if(apm<12)
    {
        apm="오전";
    }
    else
    {
        apm="오후";
    }
    
    var msg = "현재시간 : "+apm +(currentDate.getHours()-12)+"시";
    msg += currentDate.getMinutes() + "분";
    msg += currentDate.getSeconds() + "초";
    
    divClock.innerText=msg;
    
    setTimeout(showClock,1000);
}



</script>
</head>
<body>
 <header>  
 <h1 style="text-align: center;">
              <a href="main2.jsp" ><img src="images/login_logo.png" width="200" height="200">
           </a>
     </h1>
     </h1>
     </header>     
     <h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다. <br>
	<button type="button" id="btnLogout">로그아웃</button><br>
     <nav>
        <ul>
            <li><a href="main2.jsp">홈</a></li>
            <li><a href="chul.jsp">출석체크</a></li><
            <li><a href="cc.jsp">회사 소개</a></li>
            <li><a href="find.jsp">물건 찾기</a></li>
            <li><a onclick="loginchck()">마이페이지</a></li>
        </ul>
    </nav>

<aside class="ad1">
<h2>우측 광고</h2>
</aside>
<aside class="ad2">
<h2>좌측 광고</h2>
</aside>

<div style="text-align: center;">
<img alt="" src="images/chul.png" height="600"><br>

이름 : <input id="writer" value="${sessionScope.userid}" readonly="readonly"><br>
내용 : <input id="memo" size="40" >
<input type="button" id="btnSave" value="확인"> <br>

<div>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 ");
 
 String today = sf.format(now);
%>

<%= today %><br>
</div>
<body onload="showClock()">
    <div id="divClock" class="clock"></div>
    
<select id="searchkey"><br>

  <option value="writer">이름 </option>
  <option value="memo">내용 </option>
  <option value="writer_memo">이름+내용 </option>
</select>
<input id="search" value="${search}">
<input type="button" id="btnSearch" value="조회">
</div>
<div id="result"></div>

<footer>
        Copyright & copy; 2019
    </footer>

</body>
</html>