package gi.user.dto;

public class MemberDto {
	
    // 회원구분 USER, ADMIN, BLOCK
    private String idGubun;

	// 회원SEQ 
    private int idSeq;

    // 아이디 
    private String id;

    // 비밀번호 
    private String pw;

    // 이메일 
    private String email;

    // 휴대폰 
    private String phone;

    // 텔레그램 유저넘버 
    private String tgNo;

    // 텔레그램 수신동의 
    private String tgYn;

    // 가입/탈퇴 
    private String userYn;

    // 적성검사 결과 
    private String apRslt;

    // 탈퇴사유 
    private String outRs;

    // 달풍선 갯수 
    private int dalCnt;

    // 위도 위도 못 잡으면 디폴트 0
    private double idLat;

    // 경도 경도 못 잡으면 디폴트 0
    private double idLong;

    
    
    
    


	

	@Override
	public String toString() {
		return "MemberDto [idGubun=" + idGubun + ", idSeq=" + idSeq + ", id=" + id + ", pw=" + pw + ", email=" + email
				+ ", phone=" + phone + ", tgNo=" + tgNo + ", tgYn=" + tgYn + ", userYn=" + userYn + ", apRslt=" + apRslt
				+ ", outRs=" + outRs + ", dalCnt=" + dalCnt + ", idLat=" + idLat + ", idLong=" + idLong + "]";
	}

	public MemberDto() {
		
	}

	

	public MemberDto(String idGubun, int idSeq, String id, String pw, String email, String phone, String tgNo,
			String tgYn, String userYn, String apRslt, String outRs, int dalCnt, double idLat, double idLong) {
		
		this.idGubun = idGubun;
		this.idSeq = idSeq;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.tgNo = tgNo;
		this.tgYn = tgYn;
		this.userYn = userYn;
		this.apRslt = apRslt;
		this.outRs = outRs;
		this.dalCnt = dalCnt;
		this.idLat = idLat;
		this.idLong = idLong;
	}

	public String getIdGubun() {
		return idGubun;
	}

	public void setIdGubun(String idGubun) {
		this.idGubun = idGubun;
	}

	public int getIdSeq() {
		return idSeq;
	}

	public void setIdSeq(int idSeq) {
		this.idSeq = idSeq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTgNo() {
		return tgNo;
	}

	public void setTgNo(String tgNo) {
		this.tgNo = tgNo;
	}

	public String getTgYn() {
		return tgYn;
	}

	public void setTgYn(String tgYn) {
		this.tgYn = tgYn;
	}

	public String getUserYn() {
		return userYn;
	}

	public void setUserYn(String userYn) {
		this.userYn = userYn;
	}

	public String getApRslt() {
		return apRslt;
	}

	public void setApRslt(String apRslt) {
		this.apRslt = apRslt;
	}

	public String getOutRs() {
		return outRs;
	}

	public void setOutRs(String outRs) {
		this.outRs = outRs;
	}

	public int getDalCnt() {
		return dalCnt;
	}

	public void setDalCnt(int dalCnt) {
		this.dalCnt = dalCnt;
	}
	public double getIdLat() {
        return idLat;
    }

    public void setIdLat(double idLat) {
        this.idLat = idLat;
    }

    public double getIdLong() {
        return idLong;
    }

    public void setIdLong(double idLong) {
        this.idLong = idLong;
    }

}