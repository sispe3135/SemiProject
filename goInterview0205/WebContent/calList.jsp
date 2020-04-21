<%@page import="gi.offline.study.dto.giStudyDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="gi.user.dto.MemberDto"%>
<%@page import="gi.online.dto.giOnlineDto"%>
<%@page import="gi.offline.studymbr.dto.giStdMbrDto"%>
<%@page import="java.util.List"%>
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

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}




#listtable {
	postion : relative;
	top: 50%;
	left: 50%;

}


</style>

</head>
<body>

<% 

Map<String, List<?>>  list = (HashMap<String,List<?>>)request.getAttribute("list");
List<giStdMbrDto> offlist = (List<giStdMbrDto>)list.get("offlist");
List<giOnlineDto> onlist = (List<giOnlineDto>)list.get("onlist");
String year = request.getParameter("year");
String month = request.getParameter("month");
String date = request.getParameter("date");

%>
<div id= "allcontents">

	
	<table border = "1" id="listtable">
		
		
		<col width= "300px"/>
		<col width= "100px"/>
	
		
		<tr> <th colspan="2"><%=year %>년 <%=month %>월  <%=date %>일</th> </tr>
		<tr>
			
			<th>제목</th>
			<th>일정</th>
			
		</tr>
<% 
	if ((offlist.size()==0)&&(onlist.size()==0)) {
%>		
		<tr>
			<td colspan="2">-- 일정 없다 --- </td>
		</tr>
<% 
	} else {
		for(giStdMbrDto dto : offlist) {
%>		
		<tr>
			<td><%=dto.getStdTitle() %> </td>
			<td><%=dto.getStdDt() %> </td>
			
		<tr>
<%		
		}
		
		for(giOnlineDto ondto : onlist) {
%>		
		<tr>
			<td><%=ondto.getChatTitle() %> </td>
			<td><%=ondto.getChatStDt() %> </td>
			
		<tr>
<%	
		}
	}
		

%>		
	
	
	</table>
</div>
</body>
</html>