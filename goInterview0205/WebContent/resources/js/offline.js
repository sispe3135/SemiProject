// menu hover
$(function() {
   
   $(".offonmenu div").css("display", "none");

   $(".offonmenu").hover(function(){
      $(this).children("div").toggle();
      $(this).css("background-color", "rgb(245, 62, 91)");
      $(this).children("div").children("a").css("color", "white");
      $(this).children("a").css("color", "white");
      
   }, function (){
	   $("a:link").css("color", "black");
	   $(this).children("div").toggle();
	   $(this).css("background-color", "white");
   });
   
});   
///////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////////////////////




