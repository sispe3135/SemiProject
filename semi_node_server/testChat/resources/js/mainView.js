$(function(){
	
	var loginPageCnt = 1;
	$(document).ready(function() { 

	   $("#loginPage").hide();
	   $("#barPage").hide();
	   
       $.ajax({

           type : "post",
           url : "login.jsp",
           dataType : "text",
           success : function(data) {

              $("#loginPage").html(data);

           },
           error : function() {
              alert("통신 실패");
           }

        });
	});
	   // login 버튼 눌렀을때 화면 나오는 기능
	   $("#mainLogin").click(function() {

	      if (loginPageCnt == 1) {
	         
	         $("#loginPage").show();

	         $('#loginPage').animate({
	            'left' : "+=50%"
	         });

	         $.ajax({

	            type : "post",
	            url : "login.jsp",
	            dataType : "text",
	            success : function(data) {

	               $("#loginPage").html(data);

	            },
	            error : function() {
	               alert("통신 실패");
	            }

	         });
	         
	         loginPageCnt++;
	         
	      } else {
	         $("#loginPage").show();
	         
	         $('#loginPage').animate({
	              'left' : "+=100%"
	              });
	         
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
	         
	         loginPageCnt++;
	      }

	   });
	
	// menuBar 버튼 눌렀을때 화면 나오는 기능	
	$("#mainBar").click(function(){
		
		$("#barPage").show();
		
	    $('#barPage').animate({
	      'left' : "0%"
	    });
	    
	    
	    $.ajax({
			
			type: "post",
			url: "menuBar.jsp",
			dataType: "text",
			success: function(data){
				
				$("#barPage").html(data);
				
			}, error: function(){
				alert("통신 실패");
			}
			
		});

	    
	});
	
	$("#mainLogout").click(function(){
		location.href = "logout";
	});
	
	
});









//$('#loginPage').animate({
//    'marginLeft' : "+=50%", //moves left
//    'marginTop' : "-=50%" //moves left
//    });
//    $('#barPage').animate({
//    'marginRight' : "+=50%", //moves right
//    'marginTop' : "-=50%" //moves left
//    });
//    $('#reset').hide(); 
//    $('#move').show();