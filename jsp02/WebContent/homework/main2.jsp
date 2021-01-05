<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="layout1.css" type="text/css" rel="stylesheet">
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do";
	});
});
</script>
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
<button type="button" id="btnLogout">로그아웃</button>
     </header>
      <nav>
        <ul>
            <li><a href="chul.jsp">출석체크</a></li>
            <li><a href="cc.jsp">회사 소개</a></li>
            <li><a href="find.jsp">물건 찾기</a></li>
            <li><a href="mypage.jsp">마이페이지</a></li>
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