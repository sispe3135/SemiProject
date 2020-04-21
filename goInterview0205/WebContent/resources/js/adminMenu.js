$(function(){
	
	$("ul li").each(function(){
		if($(this).attr("data-val")) {
			var dataNav = $(this).attr("data-nav");	
			if ( dataNav == $(this).attr("data-val")  ) {
				$('#admin-navigation li').removeClass('selected');
				$(this).addClass('selected');
				
				
				if(dataNav == "member"){
					$('#boardSize').hide();
					$('#boardSize2').show();
				} else {
					$('#boardSize').show();
					$('#boardSize2').hide();
				}
				
				return true;
			} else {
				if (  dataNav == "qna"){
					if ($(this).attr("data-val") == "qnaList") {
						$('#boardSize').show();
						$('#boardSize2').hide();
						$(this).addClass('selected');
					} else if ( $(this).attr("data-val") == "qnaAnswer") {
						$('#boardSize').hide();
						$('#boardSize2').show();
						$(this).addClass('selected');
					}
				}					
			}
			
			
		}
	})
	
	$('#admin-navigation').on('click', 'li', function() {
		$('#admin-navigation li').removeClass('selected');
		$(this).addClass('selected');
		
		var dataNav = $(this).attr("data-nav");		
				
		if(dataNav == "qna"){
			
			location.href='./adminQnaList';
		}else if(dataNav=="telegram"){
			location.href='./telesend';
		}else if(dataNav=="member"){
			location.href="./adminMemberSearch";
		}
		

		
	});
	
	
});