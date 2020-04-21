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

<link href="resources/css/admin_Qna_Tele.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src = "resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src ="resources/js/admin_Tele.js"></script>


</head>
<%
	String dataNav=(String)request.getAttribute("dataNav");
%>

<%
	List<String> teleid= (List)request.getAttribute("teleNos");
%>
<script type="text/javascript">
var teleNos= <%= teleid %>
</script>

<body>

<div id = "allContents">

	<div id = "adminHeaderMenuBoard">
		<%--  <%@ include file = "resources/header_footer/adminMenu.jsp" %> --%>
		<jsp:include page="resources/header_footer/adminMenu.jsp" flush="false">
			<jsp:param name="dataNav" value="<%=dataNav%>" />
		</jsp:include>
	</div>
	
	<div id = "admin-tele">
	<h1>텔레그램 아이디 입력 회원들에게 단체메시지 보내기</h1>
	<input type="text" id="tele" >
	<input type="button" value="SEND" id="sendTele">


	</div>
	
	
</div>

	<div id = "footer">
	<%@ include file = "resources/header_footer/footer.jsp" %>
	</div>


</body>
</html>