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

<link href="resources/css/admin_Qna_Answer.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

</head>
<%	
	giQnaDto dto = (giQnaDto)request.getAttribute("dto"); 
	String adminId = (String)request.getAttribute("adminId");
	String dataNav=(String)request.getAttribute("dataNav");
%>

<body>

<div id = "allContents">

	<div id = "adminHeaderMenuBoard">
		<%--  <%@ include file = "resources/header_footer/adminMenu.jsp" %> --%>
		<jsp:include page="resources/header_footer/adminMenu.jsp" flush="false">
			<jsp:param name="dataNav" value="<%=dataNav%>" />
		</jsp:include>
		
	</div>
	
	<div id = "answer-table">
	<form action="./adminQnaAnswerUpdate" method="post">
		<input type="hidden" name="adminId" value="<%=adminId %>"/>
		<input type="hidden" name="qSeq" value="<%=dto.getqSeq() %>"/>
		<table frame="void">
			<col width="60px"/>
            <col width="100px"/>
            <col width="300px"/>
            <col width="100px"/>
            <col width="60px"/>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>날짜</th>
				<th>상태</th>
			</tr>
			<tr>
				<td><%=dto.getqSeq() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getqTitle() %></td>
				<td><%=dto.getqInstDt() %></td>
				<td><%=dto.getqStat() %></td>
			</tr>
			<tr>
				<td colspan = "5"><textarea rows="30" cols="118" name="content" readonly><%=dto.getqContents() %></textarea></td>
			</tr>
			<tr>
				<th colspan = "2">첨부파일</th>
				<td colspan = "1"><%=dto.getqOriFileNm() %></td>
				<td colspan = "2"><%=dto.getqSaveFileNm() %></td>
			</tr>
			<tr>
				<td colspan = "5"><textarea rows="40" cols="118" name="reContent"><%=dto.getReContents() %></textarea></td>
			</tr>
		</table>
		<button type="submit" id="answer-btn" onclick="location.href='./qnaList'">답변등록</button>
	</form>
	</div>
	
	<button id="list-btn" onclick="location.href='./adminQnaList'">목록</button>


</div>

	<div id = "footer">
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>


</body>
</html>