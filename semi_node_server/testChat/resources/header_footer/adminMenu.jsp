<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/adminMenu.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src ="resources/js/adminMenu.js"></script>
<script type="text/javascript" src = "resources/js/mainView.js"></script>

</head>
<%String dataNav=(String)request.getParameter("dataNav"); %>
<body>

	<div id="mainView">
		<img src="resources/img/main_mypage/gradient.svg" id="mainGradient"/>
		<img src="resources/img/main_mypage/menuBar.svg" id="mainBar"/>
		<a href= "./logout"><img src="resources/img/main_mypage/main_logout.svg" id="mainLogout"/></a>	
		<a href = "mainView.jsp"><img src="resources/img/main_mypage/logo.svg" id="logo"/></a>
	</div>

	<div id = "barPage"></div>
	
	<div id="admin-menu">
        <ul id="admin-navigation">
            <li data-nav="member" data-val="<%=dataNav%>"><h1>회 원 조 회<h1></li>
            <li class="separater"><h1>&nbsp|&nbsp<h1></li>
            <li data-nav="group" data-val="<%=dataNav%>"><h1>모 임 조 회<h1></li>
            <li class="separater"><h1>&nbsp|&nbsp<h1></li>
            <li data-nav="statistics" data-val="<%=dataNav%>"><h1>통 계<h1></li>
            <li class="separater"><h1>&nbsp|&nbsp<h1></li>
            <li data-nav="qna" data-val="<%=request.getParameter("dataNav")%>"><h1>Q & A<h1></li>
            <li class="separater"><h1>&nbsp|&nbsp<h1></li>
            <li data-nav="telegram" data-val="<%=dataNav%>"><h1>텔 레 그 램<h1></li>            
        </ul>
	</div>

	<div id="boardSize" class="hide">
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
	<div id="boardSize2" class="show">
		<img src = "resources/img/main_mypage/white_board2.svg" id = "whiteBoard2"/>
	</div>	
	
</body>
</html>