package gi.offline.study.dto;



public class giStudyDto {

	// 스터디그룹SEQ
	private int stdSeq;

	// 제목
	private String stdTitle;

	// 내용
	private String stdContents;

	// 스터디모임 날짜
	private String stdDt;

	// 작성자
	private String stdId;

	// 스터디그룹 상태 예약:R, 진행중:A 종료:E 예약마감:RE
	private String stdStat;

	// 화면 노출 여부
	private String stdShowYn;

	// 최대인원수 신청자가 다 차면 스터디그룹상태가 예약마감으로 바뀌고, 신청자 더 안받는다.
	private int stdMbrNum;
	
	
	
	public giStudyDto() {
		
	}
	
	
	
	public giStudyDto(int stdSeq, String stdTitle, String stdContents, String stdDt, String stdId, String stdStat,
			String stdShowYn, int stdMbrNum) {
		super();
		this.stdSeq = stdSeq;
		this.stdTitle = stdTitle;
		this.stdContents = stdContents;
		this.stdDt = stdDt;
		this.stdId = stdId;
		this.stdStat = stdStat;
		this.stdShowYn = stdShowYn;
		this.stdMbrNum = stdMbrNum;
	}

	public int getStdSeq() {
		return stdSeq;
	}

	public void setStdSeq(int stdSeq) {
		this.stdSeq = stdSeq;
	}

	public String getStdTitle() {
		return stdTitle;
	}

	public void setStdTitle(String stdTitle) {
		this.stdTitle = stdTitle;
	}

	public String getStdContents() {
		return stdContents;
	}

	public void setStdContents(String stdContents) {
		this.stdContents = stdContents;
	}

	public String getStdDt() {
		return stdDt;
	}

	public void setStdDt(String stdDt) {
		this.stdDt = stdDt;
	}

	public String getStdId() {
		return stdId;
	}

	public void setStdId(String stdId) {
		this.stdId = stdId;
	}

	public String getStdStat() {
		return stdStat;
	}

	public void setStdStat(String stdStat) {
		this.stdStat = stdStat;
	}

	public String getStdShowYn() {
		return stdShowYn;
	}

	public void setStdShowYn(String stdShowYn) {
		this.stdShowYn = stdShowYn;
	}

	public int getStdMbrNum() {
		return stdMbrNum;
	}

	public void setStdMbrNum(int stdMbrNum) {
		this.stdMbrNum = stdMbrNum;
	}

}
