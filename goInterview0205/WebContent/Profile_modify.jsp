
<%@page import="gi.user.dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInterview</title>

<style type="text/css">

#modifysize {
	position:absolute;
	top: 700px;
	left:24%;
	
	width: 80%;
	text-align:left;
}



input{
	border: hidden;
	background-color: transparent;
	font-family: 'Fira Sans', 'Extra-Light';
	font-size : 20px;
	width: 300px;
	height : 40px;
}

label{
	font-family: 'Fira Sans', 'Extra-Light';
	font-size : 20px;
	color: black;
	letter-spacing: 5px;
}





h1{
	font-family: 'Fira Sans', 'Extra-Light';
	color: black;
	letter-spacing: 5px;
	position: absolute;
	top: 100px;
	float: left;
	left: 50px;
	z-index: 1;

}
#updateLine{
	position: absolute;
	width: 200px;
	clear: both;
	top: 150px;
	float: left;
	left: 50px;
	z-index: 1;
}
#update_IdBox{
position: absolute;
	top: 250px;
	float: left;
	left: 50px;

}

#update_PWBox{
	position: absolute;
	top: 300px;
	float: left;
	left: 50px;
}
#update_ChkPWBox{
position: absolute;
	top: 350px;
	float: left;
	left: 50px;

}
#update_mobileBox{
position: absolute;
	top: 400px;
	float: left;
	left: 50px;

}
#update_emailBox{
position: absolute;
	top: 450px;
	float: left;
	left: 50px;

}

#update_notificationBox{
	position: absolute;
	top: 500px;
	float: left;
	left: 50px;
}

#update_telegramBox{
	position: absolute;
	float: left;
	left: 50px;
}

#yes{
	cursor: pointer;
	position: absolute;
	top: 540px;
	float: left;
	left: 50px;
	resize: vertical;
	height: 30px;
	width: 70px;
	background-color: rgb(245, 62, 91);
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	display: flex; 
    align-items: center; 
    justify-content: center;
    text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
}

#no{
	cursor: pointer;
	position: absolute;
	top: 540px;
	float: left;
	left: 120px;
	resize: vertical;
	height: 30px;
	width: 70px;
	background-color: rgb(245, 62, 91);
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
	display: flex; 
    align-items: center; 
    justify-content: center;
    text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
}


#question{
	position: absolute;
	float: left;
	left: 530px;
	width: 30px;
	height: 30px;
}

#telegram_info{
	position: absolute;
	float: left;
	left: 50px;
	width: 480px;
	height: 260px;
	background-color: white;
	border-radius: 15px;
	text-align: center;
	border-color: black;
	border: solid 1px;
}

#telegram_info_question{
	position: absolute;
	float: left;
	left: 530px;
	width: 30px;
	height: 30px;
}


#updateLine{
	position: absolute;
	width: 200px;
	clear: both;
	top: 150px;
	float: left;
	left: 50px;
	z-index: 1;
	height : 1px;
	background-color: black;
}
.Line{
	width: 550px;
	height : 1px;
	background-color : black;
}
#buttons{
	text-align: center;
}
.texts{
	
}



#cancelButton {
	cursor: pointer;
	position: absolute;
	top: 670px;
	float: left;
	left: 330px;
	resize: vertical;
	height: 50px;
	width: 200px;
	background-color: rgb(245, 62, 91);
	border-radius: 15px;
	display: flex; 
    align-items: center; 
    justify-content: center;
    text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	z-index: 1;
}

#submitButton {
	cursor: pointer;
	position: absolute;
	top: 670px;
	float: left;
	left: 100px;
	resize: vertical;
	height: 50px;
	width: 200px;
	background-color: rgb(245, 62, 91);
	border-radius: 15px;
	display: flex; 
    align-items: center; 
    justify-content: center;
    text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	z-index: 1;
}
#submit_button{
	cursor: pointer;
	text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	font-size: 20px;
}
#cancel_button{
	cursor: pointer;
	text-align: center;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	font-size: 20px;

}

</style>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/mypage.js"></script>

<script type="text/javascript">
$(function(){
	
//	$("#register_telegramBox").slideUp();
//	$("#question").slideUp();
	$("#update_telegramBox").css("display", "none")
	$("#update_telegramBox").css("top", "620px");
	$("#question").css("top", "620px");
	$("#question").css("display", "none")
//	$("#update_long_btn").css("top", "600px");
	$("#no").css("background-color", "rgb(245, 62, 91)");
	$("#no").css("color", "white");
	$("#yes").css("background-color", "white");
	$("#yes").css("color", "rgb(245, 62, 91)");
	
	
	// yes 눌렀을때
	$("#yes").click(function(){
	      
//		$("#register_telegramBox").slideDown();
//		$("#question").slideDown();
		$("#update_telegramBox").css("display", "block");
		$("#update_telegramBox").css("top", "600px");
		$("#question").css("top", "600px");
		$("#question").css("display", "block")
//		$("#register_long_btn").css("top", "600px");
		$("#yes").css("background-color", "rgb(245, 62, 91)");
		$("#yes").css("color", "white");
		$("#no").css("background-color", "white");
		$("#no").css("color", "rgb(245, 62, 91)");
		document.getElementById("tg_YN").value="Y";
		
	});
	
	
	// no 눌렀을때
	$("#no").click(function(){
	      
//		$("#register_telegramBox").slideUp();
//		$("#question").slideUp();
		$("#telegram_info").slideUp();
		$("#telegram_info_question").slideUp();
		$("#update_telegramBox").css("display", "none");
		$("#question").css("display", "none");
//		$("#register_long_btn").css("top", "550px");
		$("#no").css("background-color", "rgb(245, 62, 91)");
		$("#no").css("color", "white");
		$("#yes").css("background-color", "white");
		$("#yes").css("color", "rgb(245, 62, 91)");
		document.getElementById("tg_YN").value="N";
		document.getElementById("tg_NO").value="";
		
	});
	
	$("#telegram_info").toggle();
	$("#telegram_info_question").toggle();
	
	
	// 물음표 버튼 눌렀을때
	$("#question").click(function(){
		$("#telegram_info").slideDown();
		$("#telegram_info").css("top", "600px");
		$("#telegram_info").css("z-index", "1");
		$("#telegram_info_question").slideDown();
		$("#telegram_info_question").css("top", "600px");
		$("#telegram_info_question").css("z-index", "1");
	});
	
	
	// 텔레그램안에 있는 물음표 눌렀을때
	$("#telegram_info_question").click(function(){
		$("#telegram_info").slideUp();
		$("#telegram_info_question").slideUp();
	});
	
	
	
});


	
	


</script>


<link href="resources/css/mypageView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

</head>

<%	
		MemberDto dto = (MemberDto)request.getAttribute("dto");		
%> 

<body>

<div id = "allContents">
	<div id = "userHeader">
		<%@ include file = "resources/header_footer/userHeader.jsp" %> 
	</div>
	
	<div id = "boardSize">
		
		<img src = "resources/img/main_mypage/red_board.svg" id = "redBoard"/>
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
	<div id="menu1" class="promenu">
		<a href="modhome">프로필</a>
		<div>
			<a href="modhome">수정</a>
		</div>
		<div>
			<a href="delete">탈퇴</a>
		</div>
	</div>
	<div id="menu2" class="promenu">
		<a href="calendar">일정보기</a>
		<div>
			<a href="onlinecalonly">모의면접</a>
		</div>
		<!-- link!!!! -->
		<div>
			<a href="offcalonly">스터디 모임</a>
		</div>
		<div>
			<a href="calendar">완료 스터디</a>
		</div>
	</div>

	<div id="menu3" class="promenu">
		<!-- link!!!! -->
		<a href="">결제</a>
		<div>
			<a href="javascript:void(0);" onclick="window.open('pay.jsp?id=<%=dto.getId()%>', '', 'width=800,height=600');" id = "pay">결제하기</a>
		</div>
		<div>
			<a href = "dalCnt">달풍선 보기</a>
		</div>
	</div>

   <div id="modifysize">
	<form action="update" method="post" id="modifyForm">
<!-- <input type="hidden" name ="command" value ="update"/> -->
		<input type="hidden" id="tg_YN" name="tgYn" value="N">
		  
		  
		  	<h1>Update</h1>
		  	<hr id = "updateLine"/>
		  	<!-- id 창 -->
		  	<div id ="update_IdBox">
		  		<label id="updateID">
		  		* user id :
		  		</label>
		  			 <input type="text" name="id" class="texts" value="<%=dto.getId()%>" readonly="readonly">
		  		<hr class="Line"/>	 
		  	</div>
		  	<!-- 패스워드 -->
		  	<div id ="update_PWBox">
		  		<label id="updatePW">
		  			 * password :
		  		</label>
		  			 <input type="password" name="password" class="texts" value="<%=dto.getPw()%>" />
		  		<hr class="Line"/>	 
		  	</div>
		  	<!-- 패스워드 확인 -->
		  	<div id ="update_ChkPWBox">
		  		<label id="updateChkPW">
		  			 * re-password :
		  		</label>
		  			 <input type="text" name="password" class="texts" placeholder="please confirm your password"/>
		  		<hr class="Line"/>	 
		  	</div>
		  	
		  	<!-- 모바일하기 -->
			<div id = "update_mobileBox">
				<label id = "updateMobile">
					* mobile :
				</label>
					<input type= "text" name="phone" class="texts" value="<%=dto.getPhone()%>"/>
				<hr class="Line"/>
			</div>
		  	
		  	<!-- email -->
			<div id = "update_emailBox">
				<label id = "updateEmail">
					* e-mail :
				</label>
					<input type= "text" name="email" class="texts" value="<%=dto.getEmail()%>"/>
				<hr class="Line"/>
			</div>
		  	
		  	
			<!-- 알림수신 yes/no -->
			<div id = "update_notificationBox">
				<label id = "updateNotification">
					notification
				</label>
			</div>
			
			
			<!-- notification yes/no -->
			<input id = "yes" name="tgYn" value = "yes" readonly = "readonly"/>
			<input id = "no" name="tgYn" value = "no" readonly = "readonly"/>
			
			
			
			<!-- yes 눌렀을때 telegram 보였다가 안보였다가 -->
			<div id = "update_telegramBox">
				<label id = "updateTelegram">
					id-number :
				</label>
					<input type= "text" placeholder="please insert 9 numbers" name="tgNo" ID="tg_NO"/>	
				<hr class = "Line"/>
			</div>
			<div id = "question"><img src = "resources/img/main_mypage/question.svg"/></div>
	
			
			
			<!-- update, cancel 버튼 -->
			<div id="buttons">
				<div id="cancelButton">
					<input type="button" value="cancel" id="cancel_button">
			 	</div> 	
	  		 	<div id="submitButton">
	  		 		<input type="submit" value="update" id="submit_button">
	  		 	</div>
		 	</div>
		 	
		 	<!-- telegram 물음표 눌렀을때 나오는 창 -->
	<div id = "telegram_info"><a>information about telegram</a></div>
	<div id = "telegram_info_question"><img src = "resources/img/main_mypage/question.svg"/></div>
	</form>
   
   
   
   </div>
   
   
</div>

	<div>
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>

</body>
</html>