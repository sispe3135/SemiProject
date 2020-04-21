<%@page import="gi.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	System.out.println(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/pay.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<!-- <script type="text/javascript" src = "resources/js/pay.js"></script> -->

<script type="text/javascript">
	

var quantity = 0;
var id = "<%=id%>";

function oneCheck(obj) {
	var chk = document.getElementsByName("dal");
	for (var i = 0; i < chk.length; i++) {
		if (chk[i] != obj) {
			chk[i].checked = false;

		} else {
			quantity = chk[i].value;
			console.log("chk.val:"+chk[i].value);
		}
	}
}

		$(function() {

		$("#payment").click(function() {
			console.log(quantity);
			location.href = "pay?quantity="+quantity+"&id="+id;
		});	
});	

	
</script>

</head>

<h1>달풍선을 선택해주세요</h1>

<body>
	<%-- <input type="hidden" name = "id" value = "<%=id%>"/> --%>
	<div>
		<ul>
			<li><input type="checkbox" name="dal" value="10" onclick="oneCheck(this)" />달풍선 10개 : 1,000원</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="dal" value="20" onclick="oneCheck(this)" />달풍선 20개 : 2,000원</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="dal" value="30" onclick="oneCheck(this)" />달풍선 30개 : 3,000원</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="dal" value="40" onclick="oneCheck(this)" />달풍선 40개 : 4,000원</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="dal" value="50" onclick="oneCheck(this)" />달풍선 50개 : 5,000원</li>
		</ul>
	</div>

	<!-- 	<input type = "submit" value = "카카오페이 결제하기"/>-->
	<input type="button" value="카카오페이 취소하기" onclick="javascript:window.close()" />
	<button id="payment">카카오페이 결제하기</button>

	<%-- <button onclick = "location.href = './pay?id=<%=id%>'">카카오페이 결제하기</button>
	<button onclick = "location.href = ''">카카오페이 취소하기</button> --%>

</body>
</html>