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



</head>
<body>

<% 

List<giStdMbrDto> list = (List<giStdMbrDto>)request.getAttribute("list");
String year = request.getParameter("year");
String month = request.getParameter("month");
String date = request.getParameter("date");

for (giStdMbrDto dto : list) {
	System.out.println(dto.getStdTitle());	
}

%>
	<h1>일정목록</h1>
	
	<table border = "1">
		
		
		<col width= "100px"/>
		<col width= "100px"/>
		<col width= "100px"/>
		
		<tr> <th colspan="3"><%=year %>년 <%=month %>월  <%=date %>일</th> </tr>
		<tr>
			
			<th>제목</th>
			<th>일정</th>
			<th>내용</th>
		</tr>
<% 
	if (list.size()==0) {
%>		
		<tr>
			<td colspan="3">-- 일정 없다 --- </td>
		</tr>
<% 
	} else {
		for(giStdMbrDto dto : list) {
%>		
		<tr>
			<td><%=dto.getStdTitle() %> </td>
			<td><%=dto.getStdDt() %> </td>
			<td><%=dto.getStdContents() %> </td>
		<tr>
<%		
		}
	}
		

%>		
	
	
	</table>
	
</body>
</html>