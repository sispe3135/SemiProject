<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/pwdChk.js"></script>
</head>
<%	
   	String seq = request.getParameter("qSeq");
	String pw = request.getParameter("qPwd");
%>
<body>
	<div>
		
			<input type="hidden" name="qSeq" value="<%=seq %>"/>
			<input type="hidden" name="qPw" value="<%=pw %>"/>
			비밀번호 : 
			<input type="password" name="pw" maxlength="50"/>
			<br><br>
			<input type="button" value="확인" onclick="checkValue()"/>
			<input type="button" value="창닫기" onclick="window.close()"/>
		
	</div>
</body>
</html>