<%@page import="gi.online.dto.giOnlineDto"%>
<%@page import="java.util.List"%>
<%@page import="gi.online.dao.Util"%>
<%@page import="gi.user.dto.MemberDto"%>
<%@page import="gi.online.biz.giOnlineBiz"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInterview</title>



<link href="resources/css/offlineView.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/cal.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/footer.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#calendarsize{
	top: 700px;

}

</style>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src = "resources/js/offline.js"></script>
<script type="text/javascript">
$(function() {
	$(".countview").click(function() {
		function isTwo(n) {
			return (n.length < 2) ? "0" + n : n;
		}
		var year = $(".y").text().trim();
		var month = isTwo($(".m").text().trim());
		var cdate = $(this);
		var date = isTwo(cdate.text().trim());
		var screenW = screen.availWidth;  // 스크린 가로사이즈
		var screenH = screen.availHeight; // 스크린 세로사이즈
		var popW = 400; // 띄울창의 가로사이즈
		var popH = 400; // 띄울창의 세로사이즈
		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 
		var posT=( screenH-popH ) / 2;   // 띄울창의 세로
		var url ="onlinecallist?year="+year+"&month="+month+"&date="+date+"";
		window.open(url,'test','width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
		
	});
	
	
	
});

</script>






</head>
<body>

	<div id = "allContents">
	
	<div id = "userHeader">
		<%@ include file = "resources/header_footer/userHeader.jsp" %> 
	</div>
	
	<div id = "boardSize">
		<img src = "resources/img/main_mypage/white_board.svg" id = "whiteBoard"/>
	</div>
	
		<div id="menu1" class="offonmenu">
		      <a href="offcalonly">오프라인</a>
		      <div><a href="offlineListAll">모아보기</a></div>
		      <div><a href="offcalonly">스터디모임</a></div>
		       <div><a href="offlineMake">스터디개설</a></div>
		 </div>
		 <div id="menu2" class="offonmenu">
		      <a href="onlinecalonly">온라인</a>
		      <div><a href = "onlineListAll">모아보기</a></div>
		      <div><a href = "onlineMake">면접방개설</a></div>   
  		 </div>
		<%
			Calendar cal = Calendar.getInstance();

			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int today = cal.get(Calendar.DATE);

			String paramYear = request.getParameter("year");
			String paramMonth = request.getParameter("month");
			
			System.out.println("지금 연도 : "+paramYear);
			System.out.println("지금 달 : "+paramMonth);
			
			if (paramYear != null) {
				year = Integer.parseInt(paramYear);
			}
			if (paramMonth != null) {
				month = Integer.parseInt(paramMonth);
			}

			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 1) {
				month = 12;
				year--;
			}

			// 1.현재년도, 현재월, 1일로 달력 설정
			cal.set(year, month - 1, 1);

			// 2.1일의 요일
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

			// 3.현재 월의 마지막 일
			int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

			//달력에 일정 표현
			
			giOnlineBiz biz = new giOnlineBiz();
			
			MemberDto dto = (MemberDto)request.getAttribute("dto");	
			
			String yyyyMM = year + Util.isTwo(String.valueOf(month));
			System.out.println(yyyyMM);
			
			List<giOnlineDto> clist = biz.getCalViewListById(dto.getId(), yyyyMM);
			String id = dto.getId();
			

			System.out.println(dto.getId()+"가 참여하는 일정 의 수 : "+ clist.size());
		%>





		<div id="calendarsize">
			<table id="calendar">
				<caption>
					<a href="onlinecalonly?year=<%=year - 1%>&month=<%=month%>">
						&lt;&lt; &nbsp;&nbsp;</a> <a
						href="onlinecalonly?year=<%=year%>&month=<%=month - 1%>"> &lt;
						&nbsp;</a> <span class="y"
						style="color: #F53D5B; font-weight: bold; font-size: 20px;"><%=year%></span>년
					<span class="m"
						style="color: #F53D5B; font-weight: bold; font-size: 20px;"><%=month%></span>월

					<a href="onlinecalonly?year=<%=year%>&month=<%=month + 1%>">&nbsp;
						&gt; </a> <a href="onlinecalonly?year=<%=year + 1%>&month=<%=month%>">&nbsp;&nbsp;
						&gt;&gt; </a><br /> <br>
				</caption>

				<tr>
					<th>sun</th>
					<th>mon</th>
					<th>tue</th>
					<th>wen</th>
					<th>thu</th>
					<th>fri</th>
					<th>sat</th>
				</tr>

				<tr>
					<%
	// 공백
	for (int i = 0; i < dayOfWeek - 1; i++) {
		out.print("<td>&nbsp;</td>");
	}
	int cnt = dayOfWeek;
	for (int i = 1; i <= lastDay; i++) {
%>
					<td><a class="countview"
					style="color:<%=Util.fontColor(i, dayOfWeek)%>; font-size:15pt; padding:5px;"><%=i%></a>
					

						<div class="onlinelist">
							<%=Util.getCalView(i, clist)%>
						</div></td>
					<%
						if ((dayOfWeek - 1 + i) % 7 == 0) {
								out.print("</tr><tr>");
							}

						}

						// 마지막 날의 요일 : (dayOfWeek-1 + lastDay)%7
						// (7-(dayOfWeek-1 + lastDay)%7)%7

						for (int i = 0; i < (7 - (dayOfWeek - 1 + lastDay) % 7) % 7; i++) {
							out.print("<td>&nbsp;</td>");
						}
					%>
				</tr>

			</table>

		</div>


		

	</div>









	<div>
		<%@ include file="resources/header_footer/footer.jsp"%>
	</div>

</body>
</html>