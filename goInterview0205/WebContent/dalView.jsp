<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInterview</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/mypage.js"></script>

<link href="resources/css/mypageView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/dalView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>
</head>
<%
//////////////////////////////////////////여기 부분 건드리면 아니되오ㅠㅜ//////////////////////
	
	MemberDto dto = (MemberDto)request.getAttribute("dto");

%>
<body>

<div id = "allContents">
	<div id="userHeader">
			<%@ include file="resources/header_footer/userHeader.jsp"%>
	</div>
	
	<div id = "boardSize">
		
		<img src = "resources/img/main_mypage/red_board.svg" id = "redBoard"/>
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
<!-- /////////여기 js파일로 따로 넣는거 노노//////////// -->

	<p id="dalId"><%=dto.getId() %> : </p><p class = "dalCnt"></p>
	<script type="text/javascript">
		$(function(){
			
		var dalCnt = <%=dto.getDalCnt() %>;
		$({ val : 0 }).animate({ val : dalCnt }, {
			   duration: 2000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $(".dalCnt").text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $(".dalCnt").text(num + " 개");
			  }
			});

			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
		});
	</script>
	
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
</div>

	<div>
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>
	

	
</body>
</html>