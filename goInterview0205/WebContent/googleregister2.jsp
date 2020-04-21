<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/ggregisterView.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/register.js"></script>


</head>


<body>
<script>

	$(document).ready(function() {
        $('#gid').val(id);
        $('#gpw').val(pw);
    
        if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(function(position){
		    	$("#Latitude").prop("value", position.coords.latitude);
		    	$("#Longitude").prop("value", position.coords.longitude);
		    });
		  }
	});
</script>


<h1>register</h1>
<form action="insert" method="post" id="frm">
 <input type="hidden" value="" id="Latitude" name="Latitude">
 <input type="hidden" value="" id="Longitude" name="Longitude">
	

<hr id = "registerLine"/>
	<input type="hidden" id="gid" name="id" value="" />
	<input type="hidden" id="gpw" name="pw" value="" />

     
      <input type="hidden" id="tg_YN" name="tgYn" value="N">
   

	
	<!-- 로그인하기 -->

	
	
	
	<!-- 패스워드 확인하기 -->
	<!-- <div id = "register_ChkPwBox">
		<label id = "registerChkPW">
			re-password :
		</label>
			<input type= "password" placeholder="please confirm your password"/>
		<hr id = "chkPwLine"/>
	</div> -->
	
	
	
	<!-- 모바일하기 -->
	<div id = "register_mobileBox">
		<label id = "registerMobile">
			mobile :
		</label>
			<input type= "text" placeholder="please insert your phone-number" name="phone" required="required"/>
		<hr id = "mobileLine"/>
	</div>
	
	
	
	<!-- 모바일하기 -->
	<div id = "register_emailBox">
		<label id = "registerEmail">
			e-mail :
		</label>
			<input type= "text" placeholder="please insert your email" name="email" required="required"/>
		<hr id = "emailLine"/>
	</div>
	
	
	<!-- 알림수신 yes/no -->
	<div id = "register_notificationBox">
		<label id = "registerNotification">
			notification
		</label>
	</div>
	
	
	<!-- notification yes/no -->
	<input id = "yes" name="tgYn" value = "Yes" readonly = "readonly"/>
	<input id = "no" name="tgYn" value = "No" readonly = "readonly"/>
	
	
	
	<!-- yes 눌렀을때 telegram 보였다가 안보였다가 -->
	<div id = "register_telegramBox">
		<label id = "registerTelegram">
			id-number :
		</label>
			<input type= "text" placeholder="please insert 9 numbers" name="tgNo" ID="tg_NO"/>	
		<hr id = "telegramLine"/>
	</div>
	<div id = "question"><img src = "resources/img/main_mypage/question.svg"/></div>
	
	
	
	<!-- register 아래 button -->
	<div id = "register_long_btn">
		<input type="submit" value="register" id = "register_longBtn">
	</div>
	
	
	
	<!-- telegram 물음표 눌렀을때 나오는 창 -->
	<div id = "telegram_info"><a>information about telegram</a></div>
	<div id = "telegram_info_question"><img src = "resources/img/main_mypage/question.svg"/></div>
	
	 
</form>
	

	<!-- 상단 로그인/회원가입 버튼 -->
	<div id = "loginButton"><a>login</a></div>
	<div id = "registerButton"><a>register</a></div>

</body>
</html>