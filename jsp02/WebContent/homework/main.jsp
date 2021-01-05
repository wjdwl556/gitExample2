<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#logout{display:none;}
head{
background-color: #82a43a;
}

</style>
<link href="layout1.css" type="text/css" rel="stylesheet">
<%@ include file="../include/header.jsp" %>
<c:if test="${param.message == 'error' }">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	</script>w
</c:if>
<c:if test="${param.message == 'logout' }">
	<script>
		alert("로그아웃되었습니다.");
	</script>
</c:if>
<script src="../include/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#btnLogin").click(function(){
			var param="userid="+$("#userid").val()
			+"&passwd="+$("#passwd").val();
			$.ajax({
				type: "post",
				url: "/jsp02/member_servlet/login.do",
				data: param,
				success: function(result){
					$("#result").html(result);
				}
			});
		});
	});
	function getCookie(name) { 
		var cookie = document.cookie; if (document.cookie != "") { 
			var cookie_array = cookie.split("; "); for ( var index in cookie_array) { 
				var cookie_name = cookie_array[index].split("="); 
				if (cookie_name[0] == "popupYN") 
				{ return cookie_name[1]; } 
				} } return ; } 
	function openPopup(url) { 
		var cookieCheck = getCookie("popupYN"); 
		if (cookieCheck != "N") window.open(url, '', 'width=450,height=750,left=0,top=0') }
function btn(){
	alert("로그인후 이용해 주세요.");
	$("#userid").focus();
}

</script>
</head>
<body onload="javascript:openPopup('popup.jsp')">

 <header>  
 <h1 style="text-align: center;">
            <img src="images/t.jpg" width="200" height="200">
            <a href="index.html" ">화개 장터</a>
     </h1>
<div id="login">
<form method="post" name="form1" 
action="${path}/session_servlet/login.do">
<table border="1">
  <tr>
    <td>아이디 </td>
    <td><input name="userid"> </td>
  </tr>
  <tr>
    <td>비밀번호 </td>
    <td><input type="password" name="passwd"> </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="로그인">
    </td>
  </tr>
</table>
</form>
</div>
<a href="join.jsp"><button>회원가입</button></a>
<div id="result"></div>
<a href="main.jsp"><button id="logout" onclick="alert('로그아웃 되었습니다.')">로그아웃</button></a>
    </header>
    <nav>
        <ul>
            <li><a onclick="btn()">출석체크</a></li>
            <li><a href="cc.jsp">회사 소개</a></li>
            <li><a href="index.html">경매</a></li>
            <li><a onclick="btn()">마이페이지</a></li>
        </ul>
    </nav>
    <aside id="left">
        <h1>카테고리</h4>
        <ul>
            <li style="height: 20px; font-size: 30px"><a href="comeputer.jsp" target="iframe1">컴퓨터</a></li>
            <li style="height: 20px; font-size: 30px"><a href="" target="iframe1">의류</a></li>
            <li style="height: 20px;font-size: 30px"><a href="" target="iframe1">음악</a></li>
            <li style="height: 20px;font-size: 30px"><a href="" target="iframe1">영화</a></li>
            <li style="height: 20px;font-size: 30px"><a href="" target="iframe1">스포츠</a></li>
            <li style="height: 20px;font-size: 30px"><a href="" target="iframe1">레저</a></li>
            <li style="height: 20px;font-size: 30px"><a href="" target="iframe1">가구/인테리어</a></li>
            <li style="height: 20px; font-size: 30px"><a href="" target="iframe1">식품</a></li>
        </ul>
    </aside>
    <section id="main">
        <article>
            <iframe src="images/yong.mp4" name="iframe1" width="1000px;" height="1000px;" frameborder="0"></iframe>
        </article>
    </section>
    <aside id="right">
        <div id="shopcart">
            <h4>광.고.</h4>
            <br>
            <img src="images/b.jpg" height="60%" width="80"><a href="./shopcart.html"></a>
        </div>
    </aside>
    <footer>
        ⓒ 2020 화개장터
    </footer>



</body>
</html>