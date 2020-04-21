function oneCheck(obj) {

	var chk = $("input[name=dal]");
	for (var i = 0; i < chk.length; i++) {
		if (chk[i] != obj) {
			chk[i].checked = false;
			
		}
	}
}

$("#payment").click(function(){
	var quantity = 0;
	var chk = $("input[name=dal]");
	
	for (var i = 0; i < chk.length; i++) {
		if (chk[i] != obj) {
			chk[i].checked = false;
		}else {
			quantity = chk[i].val();
//			quantity = chk[i] == dal
		}
	}
	
//	location.href= "./pay?quantity="+quantity+"&id="+<%=id%>;
	
});


