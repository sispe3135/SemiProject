<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInterview</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/mypage.js"></script>
<script type="text/javascript" src = "resources/js/mainView.js"></script>
<link href="resources/css/mypageView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>
</head>
<%
//////////////////////////////////////////여기 부분 건드리면 아니되오ㅠㅜ//////////////////////
	String id = request.getParameter("id");

%>
<body>

<div id = "allContents">
	<div id="mainView">
		<img src="resources/img/main_mypage/mypage_img.jpg" id="mainImg"/>
		<img src="resources/img/main_mypage/gradient.svg" id="mainGradient"/>
		<img src="resources/img/main_mypage/menuBar.svg" id="mainBar"/>
		<img src="resources/img/main_mypage/main_login.svg" id="mainLogin"/>
<%
		String dto = null;
		if(session.getAttribute("dto")!=null){
			dto = request.getParameter("id");
			
%>
		<img src="resources/img/main_mypage/main_logout.svg" id="mainLogout"/>	
<%
		}
%>		
		<a href = "mainView.jsp"><img src="resources/img/main_mypage/logo.svg" id="logo"/></a>
	</div>
	
	<div id = "loginPage"></div>
	<div id = "barPage"></div>
	
	<div id = "boardSize">
		<img src="resources/img/main_mypage/user.svg" id = "icon_user"/>
		<img src = "resources/img/main_mypage/red_board.svg" id = "redBoard"/>
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
	<div id="menu1" class="menu">
      <a href="modhome">프로필</a>
      <div><a href="modhome">수정</a></div>
      <div><a href="delete">탈퇴</a></div>
   </div>
   <div id="menu2" class="menu">
      <a href="offstudycal">일정보기</a>
      <div><a href="calendar">모의면접</a></div>
      <!-- link!!!! -->
      <div><a href = "calendar">스터디 모임</a></div>
      <div><a href = "calendar">완료 스터디</a></div>   
   </div>

   <div id="menu3" class="menu">
   <!-- link!!!! -->
      <a href="">결제</a>
      <!-- -------------카카오페이 접근--------------- -->
      <div><a href="javascript:void(0);" onclick="window.open('pay.jsp?id=<%=id %>', '', 'width=800,height=600');" id = "pay">결제하기</a></div>
      <div><a href = "dalCnt?id=<%=id %>">달풍선 보기</a></div>
   </div>
</div>

	<div>
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>
	

	
</body>
</html>