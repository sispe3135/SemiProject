<%@page import="gi.user.biz.MemberBiz"%>
<%@page import="gi.user.dao.MemberDao"%>
<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; UTF-8");

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="138485859643-fctk68k4fk27g87q9qt0v97hr0s4forv.apps.googleusercontent.com">
<title>Insert title here</title>
</head>
<%
	MemberBiz biz= new MemberBiz();
	int id_seq=Integer.parseInt(request.getParameter("id_seq"));
	MemberDto dto=biz.selectOne(id_seq);
%>
<script>
	function deleteup(){
		location.href="controller.do?command=deleteup&id_seq="+<%=dto.getIdSeq()%>
	}
	function updateup(){
		location.href="controller.do?command=updateup&id_seq="+<%=dto.getIdSeq()%>
	}
</script>

<script>

  function signOut() {

	    
	    location.href="logout";

	}
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<body>
	<h1>user main</h1>
	<hr>
		<table border="1">

				<col width="50">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="500">
				<col width="150">
				<col width="300">

			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>전화번호</th>
				<th>이메일</th>	
				<th>수정</th>
				<th>탈퇴</th>	
			</tr>

			<tr>
				<td><%=dto.getIdSeq()%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getPw()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getEmail()%></td>
				<td><input type="button" value="수정" onclick="updateup()"></td>
				<td><input type="button" value="삭제" onclick="deleteup()"></td>
			</tr>
			<tr>
				<td colspan="9"><input type="button" value="로그아웃" onclick="location.href='logout'"></td>
			</tr>
		</table>
</body>
</html>