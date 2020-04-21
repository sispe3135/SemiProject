	$(function(){


		$("#sendTele").click(function() {

			var teleMsg = $("#tele").val();
			console.log(teleMsg);
		for(var i = 0; i < teleNos.length; i++){

		    (function(i) {

		         $.ajax({
					
		            type : "post",
		            url : "https://api.telegram.org/bot1053666162:AAG2Nbk5oJbMPGJnCTNsQ7uHYr19RiP7F2E/sendMessage?chat_id="+teleNos[i]+"&text="+teleMsg,
		            dataType : "text",
		            success : function(data) {

		               $("#loginPage2").html(data);
		               console.log(teleMsg);

		            },
		            error : function() {
		               alert(teleNos[i]+"통신 실패");
		            }

		         });
			 })(i);
		    
		   }//for문 끝나는 지점
			alert("보내기를 완료했습니다")
		})
	


	})
