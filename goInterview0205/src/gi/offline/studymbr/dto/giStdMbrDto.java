package gi.offline.studymbr.dto;

import gi.offline.study.dto.giStudyDto;

//오프라인 스터디 참여 멤버 
public class giStdMbrDto extends giStudyDto{

	// 스터디그룹SEQ
	private int stdSeq;

	// 아이디
	private String id;

	
	// TbStudyDto에서 가져오는 변수들
	private String stdTitle;

	private String stdContents;

	private String stdDt;

	private String stdId;

	private String stdStat;

	private String stdShowYn;

	private int stdMbrNum;

	
	

	public giStdMbrDto() {
		
	}

	

	
	public giStdMbrDto(int stdSeq, String id, String stdTitle, String stdContents, String stdDt, String stdId, String stdStat,
			String stdShowYn, int stdMbrNum) {
		this.id = id;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
