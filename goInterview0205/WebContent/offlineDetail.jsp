<%@page import="gi.user.biz.MemberBiz"%>
<%@page import="java.util.List"%>
<%@page import="gi.offline.studymbr.biz.giStdMbrBiz"%>
<%@page import="gi.offline.studymbr.dto.giStdMbrDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".qclass").hide();
	});
</script>
<style>

/* .mapTable {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
.mapTable th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.mapTable td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
} */

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	width: 400px;
	height: 400px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<%
	giStdMbrBiz biz = new giStdMbrBiz();
	MemberBiz bizmem = new MemberBiz();

	giStdMbrDto stdDto = (giStdMbrDto) request.getAttribute("stdDto");
	List<giStdMbrDto> list = biz.offStdMbrList(stdDto.getStdSeq());
%>

<body>
	<div>
		<label style="margin-left: 30px;">모임 제목 : </label><span><%=stdDto.getStdTitle()%></span><br>
		<hr class="line"
			style="width: 300px; text-align: left; margin-left: 4px;" />
	</div>
	<div>
		<label style="margin-left: 30px;">모임내용 : </label><span><%=stdDto.getStdContents()%></span>
		<hr class="line"
			style="width: 300px; text-align: left; margin-left: 4px;" />
	</div>
	<div>
		<label style="margin-left: 30px;">모임날짜 : </label><span><%=stdDto.getStdDt()%></span>
		<hr class="line"
			style="width: 300px; text-align: left; margin-left: 4px;" />
	</div>
	<div>
		<label style="margin-left: 30px;">최대인원수 : </label><span><%=stdDto.getStdMbrNum()%></span>
		<hr class="line"
			style="width: 300px; text-align: left; margin-left: 4px;" />
	</div>
	<script type="text/javascript">
		
	<%
			double totalLat = 0;
			double totalLong = 0;
			
			for (int i = 0; i < list.size(); i++) {
				totalLat += bizmem.selectOnebyID(list.get(i).getId()).getIdLat();
				totalLong += bizmem.selectOnebyID(list.get(i).getId()).getIdLong();
			}
 			totalLat = totalLat / list.size();
			totalLong = totalLong / list.size();
			
			System.out.println(totalLat );
			System.out.println(totalLong );
			%>
		
	</script>
	<table class="mapTable">
		<tr>
			<th>참가자아이디</th>
			<th>위도</th>
			<th>경도</th>
		</tr>

		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getId()%></td>
			<td><%=bizmem.selectOnebyID(list.get(i).getId()).getIdLat()%></td>
			<td><%=bizmem.selectOnebyID(list.get(i).getId()).getIdLong()%></td>
		</tr>

		<%
			}
		%>
	</table>
	
	<div id="map" style="width:400px;height:350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ec42265dc32cf44f988802fbe8d3446&libraries=services"></script>
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(<%=totalLat%> , <%=totalLong%>),
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('스터디', placesSearchCB, {
			location : new kakao.maps.LatLng(37.4923615 , 127.02928809999999),
			radius : 5000
			
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	</script>


</body>
</html>