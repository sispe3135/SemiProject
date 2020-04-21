<%@page import="gi.qna.dto.giQnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/QnA_Detail.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src = "resources/js/jquery-3.4.1.min.js"></script>

</head>
<%
	giQnaDto dto = (giQnaDto)request.getAttribute("dto");
%>

<body>

<div id = "allContents">

	<div id = "userHeader">
		<%@ include file = "resources/header_footer/userHeader.jsp" %> 
	</div>	

	<div id="qna-title">
		<h1 >Q & A 게시판</h1>
	</div>	

	<div id = "boardSize">
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
	<div id = "qna-table">
		<table >
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getqTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="80" name="content" readonly><%=dto.getqContents() %></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><%=dto.getqOriFileNm() %></td>
			</tr>
		</table>
	</div>
	
	<button id="list-btn" onclick="location.href='./qnaList'">목록</button>


</div>

	<div id = "footer">
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>


</body>
</html>