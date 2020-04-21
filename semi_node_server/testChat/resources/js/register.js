$(function(){
	
//	$("#register_telegramBox").slideUp();
//	$("#question").slideUp();
	$("#register_telegramBox").css("display", "none")
	$("#register_telegramBox").css("top", "550px");
	$("#question").css("top", "540px");
	$("#question").css("display", "none")
	$("#register_long_btn").css("top", "600px");
	$("#no").css("background-color", "rgb(245, 62, 91)");
	$("#no").css("color", "white");
	$("#yes").css("background-color", "white");
	$("#yes").css("color", "rgb(245, 62, 91)");
	
	
	// yes 눌렀을때
	$("#yes").click(function(){
	      
//		$("#register_telegramBox").slideDown();
//		$("#question").slideDown();
		$("#register_telegramBox").css("display", "block")
		$("#register_telegramBox").css("top", "550px");
		$("#question").css("top", "540px");
		$("#question").css("display", "block")
		$("#register_long_btn").css("top", "600px");
		$("#yes").css("background-color", "rgb(245, 62, 91)");
		$("#yes").css("color", "white");
		$("#no").css("background-color", "white");
		$("#no").css("color", "rgb(245, 62, 91)");
		document.getElementById("tg_YN").value="Y"
		
	});
	
	
	// no 눌렀을때
	$("#no").click(function(){
	      
//		$("#register_telegramBox").slideUp();
//		$("#question").slideUp();
//		$("#telegram_info").slideUp();
		$("#question").css("display", "none")
		$("#register_telegramBox").css("display", "none")
		$("#register_long_btn").css("top", "550px");
		$("#no").css("background-color", "rgb(245, 62, 91)");
		$("#no").css("color", "white");
		$("#yes").css("background-color", "white");
		$("#yes").css("color", "rgb(245, 62, 91)");
		document.getElementById("tg_YN").value="N"
		document.getElementById("tg_NO").value=""
		
	});
	
	$("#telegram_info").toggle();
	$("#telegram_info_question").toggle();
	
	
	// 물음표 버튼 눌렀을때
	$("#question").click(function(){
		$("#telegram_info").slideDown();
		$("#telegram_info").css("top", "540px");
		$("#telegram_info").css("z-index", "1");
		$("#telegram_info_question").slideDown();
		$("#telegram_info_question").css("top", "550px");
		$("#telegram_info_question").css("z-index", "1");
	});
	
	
	// 텔레그램안에 있는 물음표 눌렀을때
	$("#telegram_info_question").click(function(){
		$("#telegram_info").slideUp();
		$("#telegram_info_question").slideUp();
	});
	
	
	$("#loginButton").click(function(){
		
		$.ajax({
			
			type: "post",
			url: "login.jsp",
			dataType: "text",
			success: function(data){
				
				$("#loginPage").html(data);
				
			}, error: function(){
				alert("통신 실패");
			}
			
		});
	});
});


	
	
