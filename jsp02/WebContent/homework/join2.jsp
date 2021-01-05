<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
<style class="cp-pen-styles">
*, *:before, *:after {
	box-sizing: border-box;
}
html, body {
	height: 100%;
	width: 100%;
	overflow: hidden;
}
body { 
	margin: 0;
	color: #fff;
	background: #0a0501 url('images/background.jpg') center center no-repeat ; height: 1000; width: 1000;
	font-family: "Comfortaa", "Helvetica", sans-serif;
	
}	
.container {
  position: relative;
  margin: 0 auto;
  width: 80%;
  height: 100%;
  padding: 20px;
  background-color: rgba(0,0,0,0.6);
  border-right: 1px solid #333;
  border-left: 1px solid #333;
}

/**/
a {
  color: #ddd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}



/* STRUCTURE */

.wrapper {
  position: absolute;
  top: 50%; 
  left: 50%;
  height: 600px;
  width: 640px;
  margin-top: -250px;
  margin-left: -380px;
}

#logo {
  float: left;
  width: 350px;
  text-align: center;
  top: 20%;
  left: 20%;

}
#formContent {
  float: left;
  width: 270px;
  margin-top: 70px;
	
}

#formFooter {
	background-color: rgba(20,20,20,0.0);
	color: #ddd;
	padding: 20px 0;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
	-webkit-animation: flicker 1s ease-in-out 1 alternate, neon 1.5s ease-in-out infinite alternate;
	animation: flicker 1s ease-in-out 1 alternate, neon 1.5s ease-in-out infinite alternate;
}

#formCopy{
	color: #999;
	padding: 10px 0;
	text-align: center;
	font-size:11px;
}



/* FORM TYPOGRAPHY*/

button {
 
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  cursor: pointer;
	width: 100%;
	font-size: 16px;
	font-weight: bold;
	color: #000;
  padding: 10px 32px;


	border: solid 1px #333;
	
	background: linear-gradient(#fbdb00 0%, #fb9f00 100%);
	background: -webkit-linear-gradient(#fbdb00 0%, #fb9f00 100%);
	background: -moz-linear-gradient(#fbdb00 0%, #fb9f00 100%);
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.9);

}

button:hover {
	background: linear-gradient(#d38300 0%, #d35a00 100%);
	background: -webkit-linear-gradient(#d38300 0%, #d35a00 100%);
	background: -moz-linear-gradient(#d38300 0%, #d35a00 100%);
	color: #fff;
	border: solid 1px #333;

}



.inBox {
  background-color: rgba(0,0,0,0.9);
  border: none;
  color: #fff;
  padding: 10px 32px;
  text-align: center;
  text-decoration: none;
  display: block;
  font-size: 14px;
 
  width: 100%;
  border: 1px solid #444;
  -webkit-transition: all 0.2s ease-in-out;
  -moz-transition: all 0.2s ease-in-out;
  -ms-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
	margin: 7px auto;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.9);
}

.inBox:focus  {
	border: 1px solid #fb9f00;
}


#SafeNum{
  background-color: rgba(0,0,0,0.6);
  border: 1px dashed #555;
  color: #FFF;
  padding: 5px 0px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  letter-spacing: 9px;
  font-weight:bold;

}
input[type=text]::placeholder, input[type=password]::placeholder {

	font-style: normal !important;
	color: #ddd !important;
	letter-spacing: 0px !important;
	font-size: 14px !important;
	
}


/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0%, 10%, 0);
    transform: translate3d(0%, 10%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0%, 10%, 0);
    transform: translate3d(0%, 10%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
  animation-iteration-count: infinite;
  animation-duration: 2s;
	
	  -webkit-animation-name: fourth1;
  animation-name: fourth1;
}
	
@keyframes fourth1 {
  0% {
    opacity: .5;
    -webkit-transform: translate3d(0%, -3%, 0);
    transform: translate3d(0%, -3%, 0);
  }
  50% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
  100% {
    opacity: .5;
    -webkit-transform: translate3d(0%, -3%, 0);
    transform: translate3d(0%, -3%, 0);
  }
}	

@-webkit-keyframes back_ani {
  0% {
    opacity: 0;
    -webkit-transform: none;
    transform: none;
  }
  50% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
  100% {
    opacity: 0;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes back_ani {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}



/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #b4ff00;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
	color: #b4ff00;
	text-shadow: 0px 0px 20px 0px rgba(0, 175, 255, 0.75);
}

.underlineHover:hover:after{
  width: 100%;
}


/* OTHERS */

*:focus {
    outline: none;
} 

#icon {

	margin: 0 auto 20px auto;
}

* {
  box-sizing: border-box;
}	


</style>




<%@ include file="../include/header.jsp" %>

<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
		if(email==""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}
		if(hp==""){
			alert("핸드폰을 입력하세요.");
			$("#hp").focus();
			return;
		}
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/join.do",
			data: param,
			success: function(){
				alert("처리가 완료되었습니다.");
				window.open("main3.jsp")
			}
		});
	});
});

</script>
</head>
<body id="login">

<div class="container">


<div class="wrapper ">

 
    <!-- Icon -->
    <div id="logo" class="fadeIn first">
      <img src="images/login_logo.png" id="icon" alt="User Icon" />
    </div>

	<div id="formContent">

    <!-- Login Form -->
	<input name="userid" type="text" id="userid" class="inBox fadeIn first" size="15" maxlength="20"  style="ime-mode:disabled"  placeholder="회원아이디"/>
	<input name="passwd" type="password" id="passwd"  class="inBox fadeIn first" size="15"  maxlength="20" placeholder="비밀번호" />
	<input name="name" type="text" id="name"  class="inBox fadeIn first" size="15"  maxlength="20" placeholder="이름" />
	<input name="email" type="text" id="email"  class="inBox fadeIn first" size="15"  maxlength="20" placeholder="email" />
	<input name="hp" type="type" id="hp"  class="inBox fadeIn first" size="15"  maxlength="20" placeholder="핸드폰번호" />
	</span>
	<button id="btnJoin" type="submit" class="fadeIn first" value="회원가입" border="0">회원가입</button>


    <!-- Remind Passowrd -->
   
	<div id="formCopy">
	ⓒ 2020 화개장터
	</div>
	</div>
  </div>

</div>


<!---------------->
</div>

</body>
</html>