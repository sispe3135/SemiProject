$(function(){
   $("#pageNo").click(function(){
      $.ajax({
         
         type: "post",
         url: "QnA_List.jsp",
         dataType: "text",
         success: function(data){
            
            $("#whiteBoard").html(data);
            
         }, error: function(){
            alert("통신 실패");
         }         
      });
   });
   

   
});

