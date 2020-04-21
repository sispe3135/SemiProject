<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInterview</title>


<link href="resources/css/mypageView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

#expireform {
	position:absolute;
	top: 800px;
	left : 22%;
	width: 50%;
	text-align:left;
}


#expireform>div:nth-child(1){
	position : relative;
	width : 550px;
	top : 0px;
}

#expireform>div:nth-child(2){
	position : relative;
	width : 550px;
	top : 40px;
}

#expireform>div:nth-child(3){
	position : relative;
	width : 550px;
	top : 80px;
}

#expireform>div:nth-child(4){
	position : relative;
	width : 880px;
	top : 120px;
}

#expireform>div:nth-child(5){
	position : relative;
	width : 880px;
	top : 160px;
}

#expireform>div:nth-child(6){
	position : relative;
	width : 880px;
	top : 200px;
}
#expireform>div:nth-child(7){
	position : relative;
	width : 880px;
	top : 240px;
}
#expireform>div:nth-child(8){
	position : relative;
	width : 880px;
	top : 280px;
}

label{
	font-family: 'Fira Sans', 'Extra-Light';
	font-size : 20px;
	color: black;
	letter-spacing: 0.5px;
}
input[name="chk"] {
	margin-right: 2px;
} 

.chkLine{
	width:700px;
}

#buttons{
	text-align: center;
}
#cancelButton {
	cursor: pointer;
	position: absolute;
	
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
	background-color: transparent;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	font-size: 20px;
	border: hidden;
}
#cancel_button{
	cursor: pointer;
	text-align: center;
	background-color: transparent;
	font-family: 'Fira Sans', 'Extra-Light';
	color: white;
	letter-spacing: 5px;
	font-size: 20px;
	border: hidden;

}
</style>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/mypage.js"></script>



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
   
   <div id="expiresize">
	   	<form action="deleteres" method="get">
	   	
			
			  
			  <div id="expireform">
				  	<h1>Expire Account</h1>
				  	<hr id = "expireLine"/>
				  	
				  	<div>
					  	<input type="checkbox" name="chk" value="rs1"/><label>&nbsp;첫번째 사유</label><br/>
					  	<hr class="chkLine"/>
					</div>
					<div>  	
					  	<input type="checkbox" name="chk" value="rs2"/><label>&nbsp;두번째 사유</label><br/>
					  	<hr class="chkLine"/>
					</div>
					<div>  	
					  	<input type="checkbox" name="chk" value="rs3"/><label>&nbsp;세번째 사유</label><br/>
					  	<hr class="chkLine"/>
					</div>
					<div>  	
					  	<input type="checkbox" name="chk" value="rs4"/><label>&nbsp;네번째 사유</label><br/>
					  	<hr class="chkLine"/>
				  	</div>
				  	
				  	<div>
			  		 	<label>기타사유</label><br/>
			  		 	<textarea rows="3" cols="30" id="deleteReason" name="outrs"></textarea><br>
		  		 	</div>
	  		 	
			 		<div id="buttons">
						<div id="cancelButton">
							<input type="button" value="cancel" id="cancel_button">
					 	</div> 	
			  		 	<div id="submitButton">
			  		 		<input type="submit" value="done" id="submit_button">
			  		 	</div>
				 	</div>
			 </div>	
			
		</form>
   
   </div>
   
   
</div>

	<div>
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>

</body>
</html>