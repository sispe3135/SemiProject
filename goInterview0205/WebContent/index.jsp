<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<style>

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="138485859643-fctk68k4fk27g87q9qt0v97hr0s4forv.apps.googleusercontent.com">
<style>

</style>

<title>로그인페이지</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<%

	List<String> teleid= (List)request.getAttribute("teleNos");
%>

<script>	



	
	$(function(){
		$("#sendTele3").click(function() {
			alert("?");
			location.href="telesend"

		})

		$("#sendTele").click(function() {
			var teleNos= <%= teleid %>
			console.log(teleNos[0])
			console.log(teleNos[1])
			var teleMsg = $("#tele").val();
			console.log(teleMsg);
		for(var i = 0; i < teleNos.length; i++){
			console.log(teleMsg);
			console.log(teleNos[i]);
		    (function(i) {

		         $.ajax({
					
		            type : "post",
		            url : "https://api.telegram.org/bot1053666162:AAG2Nbk5oJbMPGJnCTNsQ7uHYr19RiP7F2E/sendMessage?chat_id="+teleNos[i]+"&text="+teleMsg,
		            dataType : "text",
		            success : function(data) {

		               $("#loginPage").html(data);
		               console.log(teleMsg);

		            },
		            error : function() {
		               alert("통신 실패");
		            }

		         });
			 })(i);
		    
		   }//for문 끝나는 지점
		})
	

	
	$("#sendTele2").click(function() {
		
			var arr = { "770927552":"hello", 
			    "745796079":"Nice to meet you"};

			 $.each(arr, function(key, val) {
//			    $('#a').html($('#a').html() + "키 : "+key+" , 값 : "+val+"<br>");
		         $.ajax({
						
			            type : "post",
			            url : "https://api.telegram.org/bot1053666162:AAG2Nbk5oJbMPGJnCTNsQ7uHYr19RiP7F2E/sendMessage?chat_id="+key+"&text="+val,
			            dataType : "text",
			            success : function(data) {

			               $("#loginPage").html(data);
			               console.log(teleMsg);

			            },
			            error : function() {
			               alert("통신 실패");
			            }

			         });
			  });
			
//	         $.ajax({
				
//	            type : "post",
//	            url : "https://api.telegram.org/bot1053666162:AAG2Nbk5oJbMPGJnCTNsQ7uHYr19RiP7F2E/sendMessage?chat_id=770927552&text="+teleMsg,
//	            dataType : "text",
//	            success : function(data) {

//	               $("#loginPage").html(data);
//	               console.log(teleMsg);

//	            },
//	            error : function() {
//	               alert("통신 실패");
//	            }

	});
	         

});
		
</script>

<script>
	//구글로 필요한
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile()
		  var loginForm = document.loginForm

		  출처: https://dololak.tistory.com/728 [코끼리를 냉장고에 넣는 방법]
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  document.getElementById('gid').value =profile.getId()
		  document.getElementById('gpw').value =profile.getEmail()
		  console.log('담긴값: '+document.getElementById('gid').value)
		  
		  signOut()
		loginForm.submit()	
		  //location.href="googlelogin"
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

</head>
<body>
	<form name="loginForm" action="googlelogin" method="post" id="logg">
	<input type="hidden" id="gid" name="id" value="" />
	<input type="hidden" id="gpw" name="pw" value="" />
	<input type="hidden" id="test" name="test" value="test" />
	</form>


	<form action="login" method="post">

	<table border="1">
		<col width="100">
		<col width="100">
		
		<tr>
			<th> i d </th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th> p w </th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<th>카카오로그인</th>
			<td>    
				<a id="kakao-login-btn" onclick=""></a>
				<a href="http://developers.kakao.com/logout"></a>
				
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

       console.log($('#gid').val());
       console.log(userID);
       console.log(userEmail);
       console.log(userNickName);
       console.log(gender);

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
			</td>
		</tr>
		
		<tr>
			<th>구글로그인</th>
			<td>
				<div class="g-signin2" data-onsuccess="onSignIn"></div>
				
			</td>
			
		</tr>

		<tr>
			<td colspan="9">
				<input type="submit" value="login">
				<input type="button" value="register" onclick="registerForm()">
				

			</td>
		</tr>

	
	</table>
	<a href="#" onclick="signOut();">로그아웃</a>

	</form>
	
	<input type="text" id="tele">
	<input type="button" value="telegram" id="sendTele">
	<input type="button" value="컬랙션객체" id="sendTele2">
	<input type="button" value="배열가져오기" id="sendTele3">
	<div id="loginPage" ></div>
	<div id="a" ></div>
	<div id="kakao-profile" ></div>
</body>
</html>