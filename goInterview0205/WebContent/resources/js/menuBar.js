$(function(){
	
	$("#whiteBar").click(function(){
		
		$("#barPage").animate({
			'left' : "-=50%"
		});
		
		
	});
	
	$(".menu div").css("display", "none");
	$(".menu a").addClass('aStyle');
	$(".menu").hover(function(){
		
		$(this).children("div").slideDown();
//		$(this).children("div").css("background-color", "rgb(245, 62, 91)");
		
		
		}, function(){
			$(this).children("div").slideUp();
		});

		
	
});






