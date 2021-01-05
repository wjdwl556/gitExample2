<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="a.css" type="text/css" rel="stylesheet">
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
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/join.do",
			data: param,
			success: function(){
				alert("처리가 완료되었습니다.");
				window.open("main.jsp")
			}
		});
	});
});
function openIdChk(){
    
    window.name = "parentForm";
    window.open("CheckID.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}

</script>
</head>

        <!-- header -->
        <div id="header">
        화개장터
        </div>


        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="userid" class="int" maxlength="20">
                         <input type="button" value="중복확인" onclick="openIdChk()">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="passwd" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">
                        <img src="m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="hp" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>
            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
    <script src="main.js"></script>
    </body>
</body>
</html>