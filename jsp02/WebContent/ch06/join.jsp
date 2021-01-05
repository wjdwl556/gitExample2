<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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

$(function(){
	$("#btnJoin").click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var name=$("#name").val();
		var email=$("#email").val();
		var hp=$("#hp").val();
		//파라미터 구성 {"변수명":값, "변수명":값, "변수명":값,...};
		var param={"userid":userid, "passwd":passwd, "name":name,
				"email":email, "hp":hp};
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
		
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/join.do",
			data: param,
			success: function(){
				alert("처리가 완료되었습니다.");
			}
		});
	});
});




</script>
</head>
<body>
<h2>회원가입과 로그인</h2>
아이디 : <input id="userid"> <br>
비밀번호 : <input type="password" id="passwd"><br>
이름 : <input id="name"> <br>
이메일 : <input id="email"> <br>
휴대폰 : <input id="hp"> <br>
<button id="btnJoin">회원가입</button>
</body>
</html>