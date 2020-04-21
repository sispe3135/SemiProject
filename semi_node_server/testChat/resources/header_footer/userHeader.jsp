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
<meta charset="UTF-8">
<title>goInterview</title>

<link href="resources/css/userHeader.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/mainView.js"></script>


</head>

<body>

<div id = "allContents">
	<div id="mainView">
		<img src="resources/img/main_mypage/main_img.jpg" id="mainImg"/>
		<img src="resources/img/main_mypage/gradient.svg" id="mainGradient"/>
		<img src="resources/img/main_mypage/menuBar.svg" id="mainBar"/>
		<a href= "./logout"><img src="resources/img/main_mypage/main_logout.svg" id="mainLogout"/></a>	
		<a href = "mainView.jsp"><img src="resources/img/main_mypage/logo.svg" id="logo"/></a>
	</div>

	<div id = "barPage"></div>
	
	
</div>	


</body>
</html>