<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="/socket.io/socket.io.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#v1 {
	position: absolute;
	width: 700px;
	height: 475px;
	left: 0%;
	top: 300px;
	z-index: 9999;
}

#videoChat {
	position: absolute;
	right: 40px;
	top: 115px;
}

#socketChat {
	font-size: 5px;
	height: 100px;
	background-color: rgb(79, 78, 92);
	color: rgb(79, 78, 92);
}
#socketChat1 {
	font-size: 5px;
	height: 100px;
	background-color: rgb(79, 78, 92);
	color: rgb(79, 78, 92);
}

h1 {
	font-size: 5px;
	height: 30px;
	background-color: rgb(79, 78, 92);
	color: rgb(79, 78, 92);
	position: fixed;
	bottom: 0;
	width: 100%;
}

#main_logo {
	position: absolute; width : 100px;
	height: 100px;
	top: 500px;
	z-index: 9999;
	width: 100px;
}

#title {
	position: absolute;
	top: 25px;
	color: white;
	font-size: 25px;
}

#titleDiv {
	margin-right: 14.5%;
	text-align: center;
}

b {
	color: red;
}

#abc {
	border-left: 10px solid rgb(79, 78, 92);
	padding: 10px;
	height: 500px;
	background-color: rgb(79, 78, 92);
	
}
#content{
	background-color: white;
	height: 450px;
	width: 500px;
}
</style>
<script type="text/javascript">
	// HTML 문서가 모두 준비되면
	jQuery(document).ready(function() {

		var socket = io.connect();
		$("#videoChat").hide();
		$("#socketChat1").hide();
		$("#abc").hide();
		// 채팅 창으로 접속 및 전환
		jQuery("#startChatting").click(function() {
			socket.emit("access", {
				room : jQuery("#inputRoom").val(),
				name : jQuery("#inputName").val()
			});

			location.href = "#chatpage";
			jQuery("#roomName").html(jQuery("#inputRoom").val());
			$("#socketChat1").show();
			$("#videoChat").show();
			$("#roomDiv").hide();
			$("#abc").show();
			$("#v1").css("top","115px");
		});

		// 이벤트를 연결합니다.
		socket.on("message", function(data) {

			pushMessage(data.name, data.message, data.date);
		});

		// 채팅방 접속 or 퇴장시 실행되는 알림 메세지
		socket.on("contact", function(data) {

			jQuery("#userCount").html(data.count);
			pushMessage(data.name, data.message, new Date().toString());
		});

		// 채팅 메시지를 전송한다.
		jQuery("#submit").click(function() {

			socket.emit("message", {
				room : jQuery("#inputRoom").val(),
				name : jQuery("#inputName").val(),
				message : jQuery("#inputMessage").val(),
				date : new Date().toString()
			});

			jQuery("#inputMessage").val("");
		});
	});

	function pushMessage(pushName, pushMsg, pushDate) {
		console.log(pushDate);
		var StrDate = pushDate.split(" ");
		var RealDate = StrDate[4].split(":");
	
		console.log(RealDate[0]+":"+RealDate[1]);
		// 입력할 문자 메시지
		var output = "";
		output += "<div>";
		output += "[" + pushName + "] : ";
		output += pushMsg;
		output += "[" + RealDate[0]+":"+RealDate[1]+ "]";
		output += "</div>";

		// 문서 객체를 추가합니다.
		jQuery(output).prependTo("#content");
		jQuery("#content").listview('refresh');
	};
	
	/* jshint esversion: 6*/
	var pc1 = new RTCPeerConnection(), // sender side
    pc2 = new RTCPeerConnection(); // receiver side

	var start = () => navigator.mediaDevices.getUserMedia({audio:true, video: true })
	  .then(stream => {
	    attachVideo(v1, v1info, stream);
	    pc1.addStream(stream);
	    $("#buttonST").css("background-color","rgb(79, 78, 92)");
		$("#buttonST").css("color","rgb(79, 78, 92)");
		$("#buttonST").css("border-color","rgb(79, 78, 92)");
		$("#buttonST").css("outline-color","rgb(79, 78, 92)");
		$("#buttonST").css("border","0");
		
	  })
	  .catch(console.error);
	
	var dimensions = v => v.videoWidth +"x"+ v.videoHeight;
	var attachVideo = (videoTag, vinfo, stream) => {
	  videoTag.srcObject = stream;
	  videoTag.addEventListener("loadedmetadata", e => update(vinfo, dimensions(videoTag)), false );
	};	
</script>
</head>
<body>
	<div id="titleDiv">
		<a id="title">go<b>i</b>nterv<b>i</b>ew
		</a>
	</div>

	<div data-role="page" id="roomDiv">
		<div data-role="header">
			<h2 id="socketChat">Socket.io Chat</h2>
		</div>
		<div data-role="content">
			<h3>입장할 방의 이름과 닉네임을 지정해 주세요</h3>
			<div data-role="fieldcontain">
				<label for="textinput">방 이름</label> <input id="inputRoom" value="" />
			</div>
			<div data-role="fieldcontain">
				<label for="textinput">닉 네임</label> <input id="inputName" value="" />
			</div>
			<input type="button" id="startChatting" value="채팅 시작" />
		</div>
	</div>
	<div>
		<h2 id="socketChat1">Socket.io Chat</h2>
	</div>



	<div id="abc">
		<div id="videoChat">
			<div data-role="page" id="chatpage">
				<div data-role="header">
					<h1>
						<span id="roomName"></span> &nbsp;:&nbsp; <span id="userCount">0</span>
					</h1>
				
				</div>
				<div data-role="content">
					<ul id="content" data-role="listview" data-inset="true"></ul>
					<input id="inputMessage" value="" /> <input type="button" id="submit" value="입력" />
					<button onclick="start()" id="buttonST">Start!</button>
				</div>
			</div>
		</div>
		<table>
			<tr>
				<td><video id="v1" autoplay width=200></video></td>
			</tr>
			<tr>
				<td id="v1info"></td>
			</tr>
		</table>
	</div>






</body>
</html>