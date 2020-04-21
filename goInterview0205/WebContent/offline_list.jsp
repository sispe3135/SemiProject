<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/offlineView.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/offline.js"></script>

</head>
<body>

	<div id="allContents">
		<div id="mainView">
			<img src="resources/img/chat/chat_img.jpg" id="ChatMainImg" /> <img
				src="resources/img/main_mypage/gradient.svg" id="mainGradient" /> <img
				src="resources/img/main_mypage/menuBar.svg" id="mainBar" /> <img
				src="resources/img/main_mypage/main_login.svg" id="mainLogin" /> <a
				href="mainView.jsp"><img
				src="resources/img/main_mypage/logo.svg" id="logo" /></a>
		</div>

		<div id="loginPage"></div>
		<div id="barPage"></div>

		<div id="boardSize">
			<img src="resources/img/main_mypage/white_board.svg" id="whiteBoard" />
		</div>

		<div id="menu1" class="menu">
			<a href="offcalonly">오프라인</a>
			<div>
				<a href="offcalonly">모아보기</a>
			</div>
			<div>
				<a href="offcalonly">스터디모임</a>
			</div>
			<div>
				<a href="offlineMake">스터디개설</a>
			</div>
		</div>
		<div id="menu2" class="menu">
			<a href="onlinecalonly">온라인</a>
			<div>
				<a href="onlinecalonly">Live</a>
			</div>
			<!-- link!!!! -->
			<div>
				<a href="onlinecalonly">모아보기</a>
			</div>
			<div>
				<a href="onlineMake">면접방개설</a>
			</div>
		</div>


		<div>
			<%@ include file="resources/header_footer/footer.jsp"%>
		</div>
	</div>


</body>
</html>