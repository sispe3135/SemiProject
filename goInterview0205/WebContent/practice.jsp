<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th colspan="2">안녕?</th>	
		</tr>
	
		
		<tr>
<%
	for(int i=0 ; i<4; i++) {

%>			

			<td>
				<div>일정</div>
				<div>dwf</div>
				<div>dwf</div>
				<div>dwf</div>
			</td>
<% 			
		if(i%2==1 ) {
				
				
%>				
		</tr>
		
<% 				
		} else if(i==4) {
%>			
		</tr>	
<%			
		}
	}
%>		
				

	
	</table>
</body>
</html>