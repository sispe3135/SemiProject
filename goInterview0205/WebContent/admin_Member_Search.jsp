<%@page import="gi.user.dto.MemberDto"%>
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

<link href="resources/css/admin_Member_Search.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

</head>
<%	
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
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


	<div class="scroll" id="scroll">
<%
	if(list.size() == 0){
%>	
		<h1>------회원정보가 없습니다.------</h1>
<%
	} else {
		for(MemberDto dto : list){
%>
		<div class="scroll-box">
			<div class="scroll-box-tbl">
				<div class="scroll-lbl">
					<label>회원 아이디 : </label>
					<br/><br/>
					<label>회  원  번  호 : </label>
					<br/><br/>
					<label>전  화  번  호 : </label>
					<br/><br/>
					<label>텔레그램 ID : </label>
					<br/><br/>
					<label>이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일 : </label>
				</div>	
				<div class="scroll-rgt">
					<span><%=dto.getId() %></span>
					<br/><br/>
					<span><%=dto.getIdSeq() %></span>
					<br/><br/>
					<span><%=dto.getPhone() %></span>
					<br/><br/>
					<span><%=dto.getTgNo() %></span>
					<br/><br/>
					<span><%=dto.getEmail() %></span>
				</div>	
			</div>
			<button class="mbr-btn" onclick="location.href=''">See all</button>
		</div>
<%	
		} 
	}
%>	
	</div>


</div>

	<div id = "footer">
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>


</body>
</html>