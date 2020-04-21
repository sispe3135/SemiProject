<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/footer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    resize();
});

$(window).on('resize', function () {
    resize();
});

function resize() {
    if (window.innerHeight > $('html').height()) {
        $('#footer').css('position', 'absolute');
        $('#footer').css('bottom', '0');
    } else {
        $('#footer').css('position', 'relative');
    }
}

</script>

</head>
<body>


<footer id = "footer">
	<pre id="kh">
		 KH정보교육원  <b>|</b>  사업자등록번호 : 851-87-00622  <b>|</b>  서울 강남 제2014-01호  <b>|</b>  대표자 : 양진선  <b>|</b>  책임자 : 양성남  <b>|</b>   
		 개인정보관리책임자 : 강명주  <b>|</b>  강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F</pre>
		   
		 <pre id="copy">
		 Copyright © 2020 Apple Inc. All rights reserved.Privacy Policy Terms of Use Sales and Refunds Legal Site Map</pre>
</footer>



</body>
</html>