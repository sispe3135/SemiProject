<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/offlineView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/onlineMake.css" rel="stylesheet" type="text/css" />
<link href="resources/css/footer.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/offline.js"></script>
<script type="text/javascript">
$(function() {
	$("#insertform").submit(function(){
		
		if($("#title").val() == ""){ 
			alert("제목 입력바람"); 
			$("#title").focus(); 
			return false; 
		}
		if($("#context").val() == ""){ 
			alert("내용 입력바람"); 
			$("#title").focus(); 
			return false; 
		}
		if($("#selectNum option:selected").val()=="") {
			alert("인원을 선택해주세요!");
			$("#selectNum").focus();
			return false;
		}
		if($("#selectNum option:selected").val()=="") {
			alert("인원을 선택해주세요!");
			$("#selectNum").focus();
			return false;
		}
		if($("#date").val()=="") {
			alert("날짜선택바람!");
			$("#date").focus();
			return false;
		}
		if($("#time").val()=="") {
			alert("시간선택바람!");
			$("#time").focus();
			return false;
		}
	
	});
	
});





</script>


</head>
<body>

	<%
		MemberDto dto = (MemberDto) request.getAttribute("dto");
	%>
	<div id="allContents">
		<div id = "userHeader">
			<%@ include file = "resources/header_footer/userHeader.jsp" %> 
		</div>

		<div id="boardSize">
			<img src="resources/img/main_mypage/white_board.svg" id="whiteBoard" />
		</div>

		<div id="menu1" class="offonmenu">
		      <a href="offcalonly">오프라인</a>
		      <div><a href="offlineListAll">모아보기</a></div>
		      <div><a href="offcalonly">스터디모임</a></div>
		       <div><a href="offlineMake">스터디개설</a></div>
		 </div>
		 <div id="menu2" class="offonmenu">
		      <a href="onlinecalonly">온라인</a>
		      <div><a href = "onlineListAll">모아보기</a></div>
		      <div><a href = "onlineMake">면접방개설</a></div>   
  		 </div>
		<div>
			<form action="onlineInsert" method="post" id="insertform">
				<div>
					<label>모의 면접 방을 개설하시겠습니까?</label>
				</div>
				<div>
					<label>그룹제목 &nbsp;  : </label> 
					<input type="text" name="title" id="title">
					<hr class="line"/>
				</div>
				<div>
					<label>최대인원수 : </label> 
					<select name="memberNum" id="selectNum">
						<option value= "">인원선택</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
					<hr class="line"/>
				</div>
				<div>
					<label>마감기간 &nbsp; : </label>
					<input type="date" name="date" id="date" style="width:250px"><input type="time" name="time" id="time" style="width:250px">
					<hr class="line"/>
				</div>

				<div>
					<label>작성자 &nbsp; &nbsp; : </label> 
					<input type="text" name="writer" id="writer" value="<%=dto.getId()%>" readonly="readonly">
					<hr class="line"/>
				</div>
				<div>
					<label>내용 &nbsp; &nbsp; &nbsp; : </label> 
					<input type="text" name="context" id="context">
					<hr class="line"/>
				</div>

				<div id="buttons">
					<input type="submit" value="create" id="insertButton">
				</div>



			</form>
		</div>

	</div>
</body>
</html>	