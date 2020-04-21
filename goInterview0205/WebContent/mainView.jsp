<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
	
	/*
	(cache를 날려버리는 명령어)
	
	데이터가 변경되었을 때 이전 내용을 화면에 보여주는 이유 :
		서버의 값이 아니라 캐시에 저장된 내용을 가져오기 때문이다
		-> 브라우저가 캐시에 응답결과를 저장되지 않게 설정한거다
		
	response.setHeader("Pragma", "no-cache");			// http 1.0
	response.setHeader("Cache-control", "no-store");	// http 1.1 // tomcat 1.1 port 8787
	response.setHeader("Expires", "0")					// proxy server
	*/
%>


<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="UTF-8">
<title>goInterview</title>
<link href="resources/css/mainView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/mainView.js"></script>

<style type="text/css">
div a:link{text-decoration:none; color:white;}
div a:visited{text-decoration:none; color:white;}
div a:active{text-decoration:none; color:white;}
div a:hover{text-decoration:none; color:white;}

</style>

</head>

<%
	
%>

<body>

<div id = "allContents">
	<div id="mainView">
		<img src="resources/img/main_mypage/main_img.jpg" id="mainImg"/>
		<img src="resources/img/main_mypage/gradient.svg" id="mainGradient"/>
		<img src="resources/img/main_mypage/menuBar.svg" id="mainBar"/>
		<img src="resources/img/main_mypage/main_login.svg" id="mainLogin"/>
		
<%
//////////////////////////////////////////여기 부분 건드리면 아니되오ㅠㅜ("mainView.jsp?id="+dto.getId());여기로받은 값)////////////
		String dto = null;
		if(session.getAttribute("dto")!=null){
			dto = request.getParameter("id");
////////////////////////////////////////////////////
%>
		<img src="resources/img/main_mypage/main_logout.svg" id="mainLogout"/>	
<%
		}
%>
		
		
		<a href = "mainView.jsp"><img src="resources/img/main_mypage/logo.svg" id="logo"/></a>
	</div>
	
	<div id = "loginPage"></div>
	<div id = "barPage"></div>
	
	<div>
		<img alt="" src="resources/img/main_mypage/footer_chat.svg" id = "icon_bottom_chat"/>
		
		<img alt="" src="resources/img/main_mypage/user.svg" id = "icon_bottom_user"/>
	</div>
	
	

	<div id = "text_icon_chat">
		<a href="onlinecalonly">온라인</a><br/>
		<a href="offcalonly">오프라인</a>
	</div>
	
	
	
	<div id = "text_icon_user">
		<a href="modhome">프로필</a><br/>
		<a href="calendar">일정보기</a><br/>
		<a href="dalCnt">결제</a>
	</div>
</div>

	
	<div>
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>
	
</body>
</html>