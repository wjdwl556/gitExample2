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
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp";
	});
});
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do"
	});
});
</script>
</head>
<body>
<header>  
  <h1 style="text-align: center;">
             <a href="main2.jsp" ><img src="../homework/images/login_logo.png" width="200" height="200">
           </a>
     </h1>
     </header>
        <h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다. <br>
	<button type="button" id="btnLogout">로그아웃</button><br>
	  <nav>
        <ul>
        	<li><a href="../homework/main2.jsp">홈</a></li>
            <li><a href="../homework/chul.jsp">출석체크</a></li>
            <li><a href="../homework/cc.jsp">회사 소개</a></li>
             <li><a href="../homework/mypage.jsp">마이페이지</a></li>
        </ul>
    </nav>
<h1 style="text-align: center;">찾기</h1>

<form name="form1" method="post" 
	action="${path}/board_servlet/search.do" style="text-align: center;">
<select name="search_option">
<c:choose>
	<c:when test="${search_option == 'writer' }">
		<option value="writer" selected>이름</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
		<option value="all">이름+제목+내용</option>	
	</c:when>
	<c:when test="${search_option == 'subject' }">
		<option value="writer">이름</option>
		<option value="subject" selected>제목</option>
		<option value="content">내용</option>
		<option value="all">이름+제목+내용</option>		
	</c:when>
	<c:when test="${search_option == 'content' }">
		<option value="writer">이름</option>
		<option value="subject">제목</option>
		<option value="content" selected>내용</option>
		<option value="all">이름+제목+내용</option>		
	</c:when>
	<c:when test="${search_option == 'all' }">
		<option value="writer">이름</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
		<option value="all" selected>이름+제목+내용</option>	
	</c:when>
</c:choose>	
</select>
<input name="keyword" value="${keyword}">
<button id="btnSearch">검색</button>
</form>


<table border="1" width="900px">
	<tr>
		<th>번호</th>
		<th>이름</th>		
		<th>제목</th>		
		<th>날짜</th>		
		<th>조회수</th>		
		<th>첨부파일</th>		
		<th>다운로드</th>		
	</tr>
<c:forEach var="dto" items="${list}">
	<c:choose>
		<c:when test="${dto.show == 'y' }">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.writer}</td>
				<td>
					<!-- 답글 들여쓰기 -->
					<c:forEach var="i" begin="1" end="${dto.re_level}">
						&nbsp;&nbsp;
					</c:forEach>
		<a href="${path}/board_servlet/view.do?num=${dto.num}">
		${dto.subject}</a>
				<!-- 댓글갯수 표시 -->
				<c:if test="${dto.comment_count > 0}">
					<span style="color: red;">(${dto.comment_count})</span>
				</c:if>
				</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td align="center">
					<c:if test="${dto.filesize > 0}">
						<a href="${path}/board_servlet/download.do?num=${dto.num}">
							<img src="../images/file.gif">
						</a>
					</c:if>
				</td>
				<td>${dto.down}</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td>${dto.num}</td>
				<td colspan="6" align="center">
					삭제된 게시물입니다.
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>	
</table>
 <footer>
       ⓒ 2020 화개장터
    </footer>

</body>
</html>


