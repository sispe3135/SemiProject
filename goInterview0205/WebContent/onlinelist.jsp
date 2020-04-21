<%@page import="gi.user.dto.MemberDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="gi.online.dto.giOnlineDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
List<giOnlineDto> list = (List<giOnlineDto>) request.getAttribute("list");
MemberDto login = (MemberDto)session.getAttribute("dto");
String year = request.getParameter("year");
String month = request.getParameter("month");
String date = request.getParameter("date");
Date today = new Date();
System.out.println("today: " + today);
SimpleDateFormat todaydate = new SimpleDateFormat("yyyy/MM/dd");
System.out.println("Date: " + todaydate.format(today));
%>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".chatSeq").hide();
		var todaydate = '<%=todaydate.format(today)%>';

		$("#chat tr").click(function() {
			var chatStDt = $(this).find("td").eq(1).html().toString();
			var chatSeq = $(this).find("td").eq(3).html();
			var userId = "<%=login.getId()%>";
			console.log(chatSeq);
			console.log(userId);
			var ChatStDtSub = chatStDt.substring(0, 8);
			todaydate = todaydate.split("/");
			sysdate = "";
			for(var i=0; i<todaydate.length; i++){
				sysdate += todaydate[i];
			}
			console.log(ChatStDtSub);
			console.log(sysdate);
			console.log(typeof ChatStDtSub);
			console.log(typeof sysdate);
			console.log(typeof chatStDt);
			
			if(ChatStDtSub == sysdate) {
				location.href="onlineChatJoin?chatStDt="+chatStDt+"&chatSeq="+chatSeq+"&userId="+userId;
			} else {
				$(".button").prop("disabled","disabled");
				$(".button").val("참여x");
			}
			
			
		});

	});
</script>

</head>
<body>

	<h1>일정목록</h1>
	
	<table id="chat" border = "1">
		
		
		<col width= "100px"/>
		<col width= "100px"/>
		
		
		<tr> <th colspan="3"><%=year %>년 <%=month %>월  <%=date %>일</th> </tr>
		<tr>
			
			<th>제목</th>
			<th>일정</th>
			<th>참여</th>
		</tr>
<% 
	if (list.size()==0) {
%>		
		<tr>
			<td colspan="3">-- 일정 없다 --- </td>
		</tr>
<% 
	} else {
		for(giOnlineDto dto : list) {
%>		
		<tr>
			<td><%=dto.getChatTitle() %> </td>
			<td><%=dto.getChatStDt() %> </td>
			<td><input type="button" value="참여" class="button" /></td>
			<td class="chatSeq"><%=dto.getChatSeq()%></td>
		<tr>
<%		
		}
	}
		

%>		
	
	
	</table>
	

</body>
</html>