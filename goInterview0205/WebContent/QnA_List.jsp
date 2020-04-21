<%@page import="gi.qna.dto.giQnaDto"%>
<%@page import="gi.util.paging.Paging" %>
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

<link href="resources/css/QnA_List.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src = "resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/qnaList.js"></script>

</head>
<%
	List<giQnaDto> list = (List<giQnaDto>)request.getAttribute("list");
	Paging paging = (Paging)request.getAttribute("paging");
%>
<body>

<div id = "allContents">

	<div id = "userHeader">
		<%@ include file = "resources/header_footer/userHeader.jsp" %> 
	</div>	

	<div id="qna-title">
		<h1>Q & A 게시판</h1>
	</div>	

	<div id = "boardSize">
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
	<div id = "qna-table">
		<table >
			<col width="100px"/>
			<col width="300px"/>
			<col width="100px"/>
			<col width="60px"/>
			<tr>
				<th>아이디</th>
				<th>제목</th>
				<th>날짜</th>
				<th>상태</th>
			</tr>
<%
	if(list.size() == 0){
%>	
				<tr>
					<th>------작성된 글이 존재하지 않습니다.------</th>
				</tr>
<%
	} else {
		for(giQnaDto dto : list){
%>	
					<tr>
						<td><%=dto.getId() %> </td>
				<!-- 	<td><a id = "pwdChk" href="./qnaDetail?qSeq=<%=dto.getqSeq() %>&qPwd=<%=dto.getqPw() %>"><%=dto.getqTitle() %></a></td>  -->
						<td><a href="javascript:void(0);" onclick="window.open('pwdChk.jsp?qSeq=<%=dto.getqSeq() %>&qPwd=<%=dto.getqPw() %>', '', 'width=300, height=100')"><%=dto.getqTitle() %></a></td>
						<td><%=dto.getqInstDt() %></td>
						<td><%=dto.getqStat() %></td>
					</tr>
<%	
		} 
	}
%>	
		</table>
	</div>
	
	<button id="write-btn" onclick="location.href='./qnaWriteForm'">글작성</button>
	
	<div id="paging">
<%
		if( paging.getCurPage() > paging.getDisplayPage()){
%>
			<button onclick="location.href='qnaList?page=<%=paging.getBlockStartNum() - 1 %>'" style="border: 1px solid rgb(79, 78, 92);background-color: white;font-size: 30px;padding: 7px 15px;border-radius: 12px;"><</button>	
<%					
		}

		for ( int i = paging.getBlockStartNum(); i <= paging.getBlockLastNum(); i++) {
			if( i > paging.totalPage()){
				
			}else if (i == paging.getCurPage()){
%>
			<button onclick="location.href='qnaList?page=<%=i %>'" class = "selected" style="border: 1px solid rgb(79, 78, 92);background-color: rgb(79, 78, 92);color: white;font-size: 30px;padding: 7px 15px;border-radius: 12px;"><%=i %></button>
<%
			}else {
%>
				<button onclick="location.href='qnaList?page=<%=i %>'" style="border: 1px solid rgb(79, 78, 92);background-color: white;font-size: 30px;padding: 7px 15px;border-radius: 12px;"><%=i %></button>
<%				
			}
		}
		if( paging.totalPage() > paging.getBlockLastNum() ){
%>
			<button onclick="location.href='qnaList?page=<%=paging.getBlockLastNum() + 1 %>'" style="border: 1px solid rgb(79, 78, 92);background-color: white;font-size: 30px;padding: 7px 15px;border-radius: 12px;">></button>
<%			
		}
%>
	</div>
</div>

	<div id = "footer">
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>


</body>
</html>