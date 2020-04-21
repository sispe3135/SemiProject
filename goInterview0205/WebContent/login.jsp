<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="138485859643-fctk68k4fk27g87q9qt0v97hr0s4forv.apps.googleusercontent.com">

<title>Insert title here</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/login.js"></script>

<script>
	//구글로 필요한
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  document.getElementById('gid').value =profile.getId()
		  document.getElementById('gpw').value =profile.getEmail()
		  signOut()
		  
		loginForm.submit()	
	}
  function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	}
  
  
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="resources/css/loginView.css" rel="stylesheet" type="text/css"/>



</head>
<body>
	<form name="loginForm" action="googlelogin" method="post" id="logg">
		<input type="hidden" id="gid" name="id" value="" />
		<input type="hidden" id="gpw" name="pw" value="" />
		<input type="hidden" id="test" name="test" value="test" />
	</form>
	<form action="login" method="post">
	
	<h1>login</h1>
	<hr id = "loginLine"/>

	<div id = "loginBox">
		<label id = "loginID">
			user id :
		</label>
			<input type= "text" placeholder="please insert your id" name="id"/>
		<hr id = "idLine"/>
	</div>

	
	<div id = "pwBox">
		<label id = "loginPW">
			password :
		</label>
			<input type= "password" placeholder="please insert your password" name="pw"/>
		<hr id = "pwLine"/>
	</div>
	
	
	<!-- 상단 로그인/회원가입 버튼 -->
	<div id = "loginBtn"><a>login</a></div>
	<div id = "registerBtn"><a>register</a></div>
	
	
	<!-- find -->
	<div id = "find_id_box">
	<a id="kakao-login-btn" onclick=""></a>

	<script type='text/javascript'>
		//카카오로 필요함
		function findId(){
			
			        $.ajax({
			            type:"GET",
			            url:"https://kauth.kakao.com/v1/user/me?access_token=fVFvRe2H1BqzqmU_Qaz6UW3Vcu9gt6JlvgDb5Ao9d_cAAAFvnUrVEgfVFvRe2H1BqzqmU_Qaz6UW3Vcu9gt6JlvgDb5Ao9d_cAAAFvnUrVEg",
			            success:function(json){
			                var list = $.parseJSON(json);
			                var listLen = list.length;
			                var contentStr = "";
			                for(var i=0; i<listLen; i++){
			                    contentStr += "[기호"+ list[i].no+"] "+ list[i].name + "후보(" + list[i].job + ")</br>";
			                }
			                $("#before").append(json);
			                $("#after").append(contentStr);
			            }
			        })
		
		}
		
		
		Kakao.init('5276cac9d4895428e4d37a8da85ac514');
		// 카카오 로그인 버튼을 생성합니다.
	   Kakao.Auth.createLoginButton({
	    container: '#kakao-login-btn',
	    success: function(authObj) {
	     
	     // 로그인 성공시, API 호출
	     Kakao.API.request({
	      url: '/v2/user/me',
	      success: function(res) {
	       console.log(res);
	       
	       var userID = res.id;     				 // 카카오톡  id
	       var userEmail = res.kakao_account.email;   // 이메일
	       var userNickName = res.properties.nickname; // 별명
	       var gender =  res.kakao_account.gender;
	
	       $('#gid').val(userID);
	       $('#gpw').val(userID);
			$("#logg").submit();
	
	
	
	      },
	      fail: function(error) {
	       alert(JSON.stringify(error));
	      }
	     });
	    },
	    fail: function(err) {
	     alert(JSON.stringify(err));
	    }
	   });
		
	
	  //]]>
	</script>
	</div>
	
	<div id = "find_pw_box">
	<div class="g-signin2" data-onsuccess="onSignIn" data-width="250" data-height="48" data-onsuccess="onSignIn" data-longtitle="true"></div>
	</div>
	
	
	<!-- login button -->
	<div id = "login_long_btn">
	<input type="submit" value="login" id = "loginTxt">
	</div>

	
	
</form>
</body>
</html>