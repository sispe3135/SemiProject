<%@page import="gi.offline.studymbr.dto.giStdMbrDto"%>
<%@page import="gi.user.dto.MemberDto"%>
<%@page import="gi.online.dto.giOnlineDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="resources/css/offlineView.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

@charset "UTF-8";

.scroll{
	-ms-overflow-style: none; /*IE and Edge*/
	scrollbar-width: none;	/*Firefox*/
}

.scroll::-webkit-scrollbar { 
    display: none;	/*Chrome, Safari, Opera*/
  }

#scroll{
	position:absolute;
	top:721px;
	left:167px;
	overflow: auto;
	width: 1044px;
	height: 1700px;
}

.scroll-box{
	border:1px solid rgb(79, 78, 92);
	width:400px;
	height:400px;
	border-radius: 12px;
	float:left;
	margin: 60px;
}
.scroll-box-tbl{
    position: relative;
    top: 30px;
    left: 34px;
    width: 373px;
    float: left;
}

.scroll-box label, span{
	text-align: left;
	font-weight: normal;
	font-size: x-large;
}

.scroll-lbl{
	float:left;

	height: 286px;
}

.scroll-rgt{
	word-break: break-all;
	float:rignt;

	width: 332px;
	height: 286px;
}

.scroll-box .mbr-btn {
	background-color: rgb(208, 208, 213);
	border: none;
	padding: 13px 126px;
	text-align: center;
	font-size: 20px;
	border-radius: 12px;
	position: relative;
	top: 40px;
	left: 43px;
}

#scrollTitle{
	position:absolute;
	top:650px;
	left:39%;
	overflow: auto;
}
#addOffline {
position:absolute;
	top:650px;
	left:80%;
	width: 50px;
	height: 50px;
}

</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/offline.js"></script>
</head>


<%	
	
	List<giStdMbrDto> list = (List<giStdMbrDto>)request.getAttribute("list");
	String dataNav=(String)request.getAttribute("dataNav");
%>
<body>
<div id = "allContents">

	<div id = "userHeader">
		<%@ include file = "resources/header_footer/userHeader.jsp" %> 
	</div>
	
	<div id = "boardSize2">
		<img src = "resources/img/main_mypage/white_board2.svg"  id = "whiteBoard"/>
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
	<div id = "scrollTitle">
		<h1>오프라인 모임 모아보기</h1>
	</div>
	<div id = "addOff">
		<a href="offlineMake"><img src = "resources/img/main_mypage/question.svg" id="addOffline"/></a>
	</div>
	
	<div class="scroll" id="scroll">
<%
	if(list.size() == 0){
%>	
		<h1>------회원정보가 없습니다.------</h1>
<%
	} else {
		for(giStdMbrDto dto : list){
%>
		<div class="scroll-box">
			<div class="scroll-box-tbl">
				<div class="scroll-lbl">
					<label>그룹 제목 : </label>
					<br/><br/>
					<label>최대 인원수 : </label>
					<br/><br/>
					<label>현재 인원수 : </label>
					<br/><br/>
					<label>접수기간 : </label>
					<br/><br/>
					<label>방장 아이디 : </label>
				</div>	
				<div class="scroll-rgt">
					<span><%=dto.getStdTitle() %></span>
					<br/><br/>
					<span><%=dto.getStdMbrNum() %></span>
					<br/><br/>
					<span><%=dto.getStdMbrNum() %></span>
					<br/><br/>
					<span><%=dto.getStdDt() %></span>
					<br/><br/>
					<span><%=dto.getStdId() %></span>
				</div>	
			</div>
			<button class="mbr-btn" onclick="window.open('offdetail?seq=<%=dto.getStdSeq()%>','상세보기','width=430px, height=630px, menubar=no, status=no, toolbar=no');">See all</button>
		</div>
<%	
		} 
	}
%>	
	</div>


</div>

<div>
	<%@ include file="resources/header_footer/footer.jsp"%>
</div>

	

</body>
</html>