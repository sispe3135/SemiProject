<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/menuBar.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/menuBar.js"></script>

</head>
<body>
<%
	MemberDto loginDto =(MemberDto)session.getAttribute("dto");
	String UserId=null;
	if(loginDto==null) {
		UserId = "로그인이 필요합니다.";
		System.out.println("UserId : "+UserId);
	} else {
		UserId = loginDto.getId();
		if(UserId.length()>8) {
			UserId= UserId.substring(0, 7)+"...";
			System.out.println("UserId : "+UserId);
		}
	}
%>


	<a><img src = "resources/img/main_mypage/user.svg" id = "user_img" style = "opacity:100%;"/></a>

	<div id ="user_id">
		<a href="modhome"><%=UserId %></a>
	</div>	
<hr id = "user_img_line"/>



	<!-- 마이페이지 -->
	<div id = "menu_mypage_box" class = "menu">
		<a id = "menuMypage">mypage</a>
		<hr id = "mypageLine"/>
		<div id = "mypage_sub_ct">
			<p><a href="modhome">• profile</a></p>
			<p><a href="calendar">• my calendar</a></p>
			<p id = "pay"><a href="dalCnt" >• pay</a></p>
		</div>
	</div>



	<!-- 온라인 -->
	<div id = "menu_online_box" class = "menu">
		<a href="onlinecalonly" id = "menuOnline">online</a>
		<hr id = "onlineLine"/>
	</div>
	
	
	
	<!-- 오프라인 -->
	<div id = "menu_offline_box" class = "menu">
		<a href="offcalonly" id = "menuOffline">offline</a><hr id = "offlineLine"/>
	</div>
	
	
	
	
	
	
	
	
	<!-- Q&A -->
	<div id = "menu_qna_box" class = "menu">
		<a id = "menuQnA" href = "qnaList">Q&A</a>
		<hr id = "QnALine"/>
	</div>
	



	<!-- menu white bar -->
	<div id = "whiteBar">
		<div id = "whiteBar1"></div>
		<div id = "whiteBar2"></div>
		<div id = "whiteBar3"></div>
	</div>


<!-- <div id = "loginPage"></div>
<div id = "barPage"></div> -->


</body>
</html>