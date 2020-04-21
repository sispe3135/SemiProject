$(function(){
	
	$("ul li").each(function(){
		if($(this).attr("data-val")) {
			if ( $(this).attr("data-nav") == $(this).attr("data-val")  ) {
				console.log($(this).attr("data-nav"), $(this).attr("data-val"))
				$('#admin-navigation li').removeClass('selected');
				$(this).addClass('selected');
				return true;
			}
		}
	})
	
	$('#admin-navigation').on('click', 'li', function() {
		$('#admin-navigation li').removeClass('selected');
		$(this).addClass('selected');
		var dataNav = $(this).attr("data-nav");		
		
		if(dataNav == "qna"){
			location.href='./adminQnaList';
		}
		
		if(dataNav == "member" || dataNav == "group" ){
			$('#boardSize').hide();
			$('#boardSize2').show();
		} else {
			$('#boardSize').show();
			$('#boardSize2').hide();
		}
		
	});
	
	
});