$(function(){
   $("#registerBtn").click(function(){
      $.ajax({
         
         type: "post",
         url: "register.jsp",
         dataType: "text",
         success: function(data){
            
            $("#loginPage").html(data);
            
         }, error: function(){
            alert("통신 실패");
         }
         
      });
   });
   
   
// login 버튼 눌렀을때 다시 들어가는 기능
   $("#loginBtn").click(function(){
	   $("#loginPage").animate({
			'left' : "-=100%"
		});
   });
   
   
   
});