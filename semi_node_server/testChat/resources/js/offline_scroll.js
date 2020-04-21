// menu hover
$(function() {
   
   $(".menu div").css("display", "none");

   $(".menu").hover(function(){
      $(this).children("div").toggle();
      $(this).css("background-color", "rgb(245, 62, 91)");
      $(this).children("div").children("a").css("color", "white");
      $(this).children("a").css("color", "white");
      
   }, function (){
	   $("a:link").css("color", "black");
	   $(this).children("div").toggle();
	   $(this).css("background-color", "white");
   });
   ////////////////////////////////////////////////////////////////////////////////////
   
   
   
   //scroll paging
   var page = 2;

   $(window).scroll(function() {
       if ($(window).scrollTop() == $(document).height() - $(window).height()) {
         console.log(++page);
         $("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');

       }
   });
   ////////////////////////////////////////////////////////////////////////////////////
   
});