<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/approval.css" rel="stylesheet" type="text/css" />

<%	
	String tid = (String)session.getAttribute("tid");
%>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	/* var open = document.location.href;
	var cid = "TC0ONETIME";
	console.log(open.substring(61, 81) + " : open"); */
	var tid = "<%=tid%>";
	console.log(tid + " : tiddddddd");
	//window.open("payHistory?tid="+tid, "", "");
	
	$("#payHistory").click(function(){
		location.href = "payHistory?tid="+tid;
	});
	
});
</script>

</head>
<body>

<h1>결제 성공했습니다 </h1>

<button id = "payHistory">결제내역 확인</button>

</body>
</html>