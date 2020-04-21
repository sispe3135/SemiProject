$(function(){
	$('#admin-navigation').on('click', 'li', function() {
		$('#admin-navigation li').removeClass('selected');
		$(this).addClass('selected');
	});
});