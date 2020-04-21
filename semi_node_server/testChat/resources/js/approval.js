$(function(){
	
	var open = document.location.href;
	var cid = "TC0ONETIME";
	console.log(open.substring(61, 81) + " : open");
	var tid = open.substring(61, 81);
	console.log(tid + " : tid");
	//window.open("payHistory?tid="+tid, "", "");
	
	$("#payHistory").click(function(){
		location.href = "payHistory?tid="+tid;
	});
	
});
