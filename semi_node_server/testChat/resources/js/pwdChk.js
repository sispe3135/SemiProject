function checkValue(){
	var qSeq = document.getElementsByName("qSeq")[0].value;
	var qPw = document.getElementsByName("qPw")[0].value;
	
	var pw = document.getElementsByName("pw")[0].value;
	
	if(qPw==pw){
		opener.location.href = './qnaDetail?qSeq='+qSeq;
		self.close();
	}else{
		alert("다시 입력해주세요");
	}
	
	
	
}