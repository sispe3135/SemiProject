package gi.qna.dto;

public class giQnaDto {

	private int qSeq;
	private String qPw;
	private String qStat;	    // 글 상태 접수:R, 완료:E
	private String qTitle;
	private String id;
	private String qInstDt;
	private String qContents;
    // 그룹번호 
    private int qGrpSeq;
    // 원본파일명 
    private String qOriFileNm;
    // 저장파일명 
    private String qSaveFileNm;
    // 저장위치 
    private String qSavePath;
    // 답변자 
    private String reId;
    // 답변내용 
    private String reContents;

	
	
	public giQnaDto() {
		super();
	}
	
	public giQnaDto(int qSeq, String qPw, String qStat, String qTitle, String id, String qInstDt, String qContents,
			int qGrpSeq, String qOriFileNm, String qSaveFileNm, String qSavePath) {
		super();
		this.qSeq = qSeq;
		this.qPw = qPw;
		this.qStat = qStat;
		this.qTitle = qTitle;
		this.id = id;
		this.qInstDt = qInstDt;
		this.qContents = qContents;
		this.qGrpSeq = qGrpSeq;
		this.qOriFileNm = qOriFileNm;
		this.qSaveFileNm = qSaveFileNm;
		this.qSavePath = qSavePath;
	}

	public giQnaDto(int qSeq, String qPw, String qStat, String qTitle, String id, String qInstDt, String qContents,
			int qGrpSeq, String qOriFileNm, String qSaveFileNm, String qSavePath, String reId, String reContents, String reDt) {
		super();
		this.qSeq = qSeq;
		this.qPw = qPw;
		this.qStat = qStat;
		this.qTitle = qTitle;
		this.id = id;
		this.qInstDt = qInstDt;
		this.qContents = qContents;
		this.qGrpSeq = qGrpSeq;
		this.qOriFileNm = qOriFileNm;
		this.qSaveFileNm = qSaveFileNm;
		this.qSavePath = qSavePath;
		this.reId = reId;
		this.reContents = reContents;
	}

	public int getqGrpSeq() {
		return qGrpSeq;
	}

	public void setqGrpSeq(int qGrpSeq) {
		this.qGrpSeq = qGrpSeq;
	}

	public String getqOriFileNm() {
		return qOriFileNm;
	}

	public void setqOriFileNm(String qOriFileNm) {
		this.qOriFileNm = qOriFileNm;
	}

	public String getqSaveFileNm() {
		return qSaveFileNm;
	}

	public void setqSaveFileNm(String qSaveFileNm) {
		this.qSaveFileNm = qSaveFileNm;
	}

	public String getqSavePath() {
		return qSavePath;
	}

	public void setqSavePath(String qSavePath) {
		this.qSavePath = qSavePath;
	}

	public String getReId() {
		return reId;
	}

	public void setReId(String reId) {
		this.reId = reId;
	}

	public String getReContents() {
		return reContents;
	}

	public void setReContents(String reContents) {
		this.reContents = reContents;
	}

	public int getqSeq() {
		return qSeq;
	}
	public void setqSeq(int qSeq) {
		this.qSeq = qSeq;
	}
	public String getqPw() {
		return qPw;
	}
	public void setqPw(String qPw) {
		this.qPw = qPw;
	}
	public String getqStat() {
		return qStat;
	}
	public void setqStat(String qStat) {
		this.qStat = qStat;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getqInstDt() {
		return qInstDt;
	}
	public void setqInstDt(String qInstDt) {
		this.qInstDt = qInstDt;
	}

	public String getqContents() {
		return qContents;
	}

	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	
	
	
}
