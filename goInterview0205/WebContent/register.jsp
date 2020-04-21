<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/registerView.css" rel="stylesheet" type="text/css"/>
<script>
function idChkConfirm(){
	var chk=document.getElementsByName('id')[0].title
     if(chk=="n"){
        alert("아이디 중복체크를 먼저해주세요");
        document.getElementsByName("id")[0].focus();
     }else{}
}

function idChked(){
	var doc=document.getElementsByName("id")[0];
   if(doc.value.trim()==""||doc.value==null||doc.value=="undefined"){
         alert("아이디를 입력해주세요")
      }else{
         open("idchk?id="+doc.value,"","width=200, height=200")
}}
      
      $(function(){
    	  if (navigator.geolocation) {
    		    navigator.geolocation.getCurrentPosition(function(position){
    		    	$("#Latitude").prop("value", position.coords.latitude);
    		    	$("#Longitude").prop("value", position.coords.longitude);
    		    });
    		  }
      });
</script>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/register.js"></script>

</head>

<body>


<h1>register</h1>
<hr id = "registerLine"/>


<form action="insert" method="post" id="frm">
   
     
      <input type="hidden" id="tg_YN" name="tgYn" value="N">
	
	<!-- 로그인하기 -->
	<div id = "register_IdBox">
		<label id = "registerID">
			user id :
		</label>
			<input type= "text" placeholder="please insert your id" name="id" required="required" title="n"/>
			<input type="button" value="id-check" onclick="idChked();" id = "idChk">
		<hr id = "idLine"/>
	</div>
	
	

	<!-- 패스워드하기 -->
	<div id = "register_PwBox">
		<label id = "registerPW">
			password :
		</label>
			<input type= "password" placeholder="please insert your password" name="pw" onclick="idChkConfirm();"  required="required"/>
		<hr id = "pwLine"/>
	</div>
	
	
	
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
			<input type= "text" placeholder="please insert your phone-number" name="phone" onclick="idChkConfirm();" required="required"/>
		<hr id = "mobileLine"/>
	</div>
	
	
	
	<!-- 모바일하기 -->
	<div id = "register_emailBox">
		<label id = "registerEmail">
			e-mail :
		</label>
			<input type= "text" placeholder="please insert your email" name="email" onclick="idChkConfirm();" required="required"/>
		<hr id = "emailLine"/>
	</div>
	 <input type="hidden" value="" id="Latitude" name="Latitude">
	 <input type="hidden" value="" id="Longitude" name="Longitude">
	
	
	<!-- 알림수신 yes/no -->
	<div id = "register_notificationBox">
		<label id = "registerNotification">
			notification
		</label>
	</div>
	
	
	<!-- notification yes/no -->
	<input id = "yes" name="tgYn" value = "yes" readonly = "readonly"/>
	<input id = "no" name="tgYn" value = "no" readonly = "readonly"/>
	
	
	
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