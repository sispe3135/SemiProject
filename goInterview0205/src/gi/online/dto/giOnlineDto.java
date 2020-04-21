package gi.online.dto;

public class giOnlineDto {
	
	// 채팅방정보
	
	 // 방 번호 
    private int chatSeq;

    // 방제목 
    private String chatTitle;

    // 방장 아이디 
    private String chatMgr;

    // 채팅시작시간 
    private String chatStDt;

   

    // 방 상태 예약:R, 진행중:A 종료:E
    private String chatStat;

   
    // 최대인원 
    private int chatNum;
    
    //채팅 참여 멤버
    
    // 아이디 
    private String id;

    // 공유할 문서URL 문서는 한번에 한개씩만 업로드할 수 있다.
    private String cmDoc;

    // 발표번호 
    private int cmChatNo;

    
    // 면접 피드백 글
    
    // 글번호 
    private int fdSeq;

    // 글제목 방번호+작성아이디+대상아이디
    private String fdTitle;

    // 글내용 
    private String fdContents;

    // 작성자 아이디 
    

    // 피드백받는 아이디 
    private String fdUser;

    // 작성일 
    private String fdDt;

    
    
    
    // 빈 생성자
    public giOnlineDto() {
		
	}

    
	
    
    
    // 채팅방 만들 때 사용할 dto
	public giOnlineDto(int chatSeq, String chatTitle, String chatMgr, String chatStDt,
			 String chatStat, int chatNum) {
		
		this.chatSeq = chatSeq;
		this.chatTitle = chatTitle;
		this.chatMgr = chatMgr;
		this.chatStDt = chatStDt;
		this.chatStat = chatStat;
		this.chatNum = chatNum;
	}
	// 채팅 참여자들에 대해서 일정을 띄울 때 사용하는 dto
	
	public giOnlineDto(int chatSeq, String chatTitle, String chatMgr, String chatStDt,
			 String chatStat,  String id, String cmDoc, int cmChatNo) {
		
		this.chatSeq = chatSeq;
		this.chatTitle = chatTitle;
		this.chatMgr = chatMgr;
		this.chatStDt = chatStDt;
		this.chatStat = chatStat;
		this.id = id;
		this.cmDoc = cmDoc;
		this.cmChatNo = cmChatNo;
	}
	
	



	public giOnlineDto(int chatSeq, String chatTitle, String chatMgr, String chatStDt, String chatStat, int chatNum,
			String id, String cmDoc, int cmChatNo, int fdSeq, String fdTitle, String fdContents, String fdUser,
			String fdDt) {
		
		this.chatSeq = chatSeq;
		this.chatTitle = chatTitle;
		this.chatMgr = chatMgr;
		this.chatStDt = chatStDt;
		this.chatStat = chatStat;
		this.chatNum = chatNum;
		this.id = id;
		this.cmDoc = cmDoc;
		this.cmChatNo = cmChatNo;
		this.fdSeq = fdSeq;
		this.fdTitle = fdTitle;
		this.fdContents = fdContents;
		this.fdUser = fdUser;
		this.fdDt = fdDt;
	}





	public int getFdSeq() {
        return fdSeq;
    }

    
	public void setFdSeq(int fdSeq) {
        this.fdSeq = fdSeq;
    }

   
    public String getFdTitle() {
        return fdTitle;
    }

    public void setFdTitle(String fdTitle) {
        this.fdTitle = fdTitle;
    }

    public String getFdContents() {
        return fdContents;
    }

    public void setFdContents(String fdContents) {
        this.fdContents = fdContents;
    }


    public String getFdUser() {
        return fdUser;
    }

    public void setFdUser(String fdUser) {
        this.fdUser = fdUser;
    }

    public String getFdDt() {
        return fdDt;
    }

    public void setFdDt(String fdDt) {
        this.fdDt = fdDt;
    }
    
    
    
    
    
    public int getChatSeq() {
        return chatSeq;
    }

    public void setChatSeq(int chatSeq) {
        this.chatSeq = chatSeq;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCmDoc() {
        return cmDoc;
    }

    public void setCmDoc(String cmDoc) {
        this.cmDoc = cmDoc;
    }

    public int getCmChatNo() {
        return cmChatNo;
    }

    public void setCmChatNo(int cmChatNo) {
        this.cmChatNo = cmChatNo;
    }
    
    
    

    public String getChatTitle() {
        return chatTitle;
    }

    public void setChatTitle(String chatTitle) {
        this.chatTitle = chatTitle;
    }

    public String getChatMgr() {
        return chatMgr;
    }

    public void setChatMgr(String chatMgr) {
        this.chatMgr = chatMgr;
    }

    public String getChatStDt() {
        return chatStDt;
    }

    public void setChatStDt(String chatStDt) {
        this.chatStDt = chatStDt;
    }

    

    public String getChatStat() {
        return chatStat;
    }

    public void setChatStat(String chatStat) {
        this.chatStat = chatStat;
    }

   
    public int getChatNum() {
        return chatNum;
    }

    public void setChatNum(int chatNum) {
        this.chatNum = chatNum;
    }

}
