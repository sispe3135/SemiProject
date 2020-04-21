<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>

<%
	JSONObject kakao = (JSONObject)request.getAttribute("kakao");
	System.out.println(kakao);	
%>
<body>

<h1>kako page</h1>

<!-- <button onclick = "kakao();" id = "kakaoPage"></button>-->

<script type="text/javascript">
	$(function(){
		//var parse = JSON.parse(pay);
		
		var pay = <%=kakao%>;
		var key = pay.next_redirect_pc_url;
		var tid = pay.tid;
		console.log("tid : " + tid);
		window.open(key,"","width=800px, height=600px");
		self.close();
		console.log(key + "a;kldsfjlasdkj");
		console.log(typeof(key));
	});
</script>


</body>
</html>