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
<title>Insert title here</title>
</head>
<style>

*{
	margin: 0;
	padding: 0;
	color: red;
	background-color: rgb(79, 78, 92);
}

li{
	text-align: center;
}

.button1 {
width:150px;
background-color: rgb(79, 78, 92);
border: none;
color:#fff;
padding: 15px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 15px;
margin: 4px;
cursor: none;

}

.button2 {
width:100px;
background-color: rgb(245, 62, 91);
border: none;
color:#fff;
padding: 15px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 15px;
margin-top: 50px;
cursor: pointer;
border-radius:10px;
}



</style>
<script>
	onload=function(){
		var id=opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("id")[0].value=id;
	}

	function confirm(bool){
		if(bool=="true"){
			opener.document.getElementsByName("pw")[0].focus()
			opener.document.getElementsByName("id")[0].title="y"
		}else{
			opener.document.getElementsByName("id")[0].focus()
		}
		self.close()
	}
</script>
<body>
<%
	String idnotused = request.getParameter("idnotused");
%>
<div id="main">
	<ul>
		<li><input type="button" name="id" class="button1"></<input></li>
		<li id="mid"><%=idnotused.equals("true")?"아이디 생성 가능":"중복된 아이디 존재"%></li>
		<li><input type="button" value="확인" id="" onclick="confirm('<%=idnotused%>')" class="button2"></<input></li>
	</ul>
</div>

</body>
</html>