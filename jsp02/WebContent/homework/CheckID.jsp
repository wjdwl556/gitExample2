<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function jungbok(){
	
	if(document.check.userid.value==""){ //id값이 없을 경우
		alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
		document.addjoin.id.focus();     // id 텍스트박스에 커서를 위치
		exit;
	}
	
	
	document.check.submit();
	
}
</script>
</head>
<body>

<% String userid = request.getParameter("userid");
   if(userid==null){ userid =""; }%>

<!-- 초기 id 필드의 값이 null이며 값이 null이면 id 값을 공백으로 전환 -->

<% String jungbokid = (String)request.getAttribute("jungbokid");%>
<!-- 초기 구동시 jungbokid는 null  -->

<% String result; %>

<% if(jungbokid==""){
	result= userid+"는 사용하셔도 됩니다.";

	
}else if(jungbokid==null && userid==""){
	
	result=""; 
	//초기 구동시 jungbokid:null, id=""이므로 상태는 ""임
			
}else{
	result= userid+"는 이미 있습니다.";
	//중복 확인시 입력한 아이디와 db 결과의 리턴값이 같은 경우
}
%>

<form action="checkid" name="check" method="post">

아이디<input type="text" name="userid" id="userid" value='<%=userid%>'>
<input type="button" value="중복검사" onclick="jungbok()" ><br>
<%=result %> <!-- 아이디가 중복인지 아닌지 상태  -->
</form>
</body>
</html>