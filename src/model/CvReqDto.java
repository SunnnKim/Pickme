package model;

public class CvReqDto {

	private int seq; 		// 시퀀스 
	private int pSeq; 		// 요청받은 일반회원 seq
	private int cSeq; 		// 요청하는 기업 seq
	private String rdate; 	// 요청일 
	private String comment; // 기업 코멘트 
	private int accept; 	// 수락여부 
	private int delmem; 	// 삭제여부 
	private int cancel;		// 취소여부(기업)
	private int cvSeq;		// 수락할 cv의 시퀀
	private String name;	// 이력서 열람요청한 기업이름 
	private int open; 	// 요청 수락한 이력서 오픈 상태
	
	public CvReqDto() {
		
	}

	public CvReqDto(int seq, int pSeq, int cSeq, String rdate, String comment, int accept, int delmem, int cancel,
			int cvSeq, String name, int open) {
		super();
		this.seq = seq;
		this.pSeq = pSeq;
		this.cSeq = cSeq;
		this.rdate = rdate;
		this.comment = comment;
		this.accept = accept;
		this.delmem = delmem;
		this.cancel = cancel;
		this.cvSeq = cvSeq;
		this.name = name;
		this.open = open;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}

	public int getcSeq() {
		return cSeq;
	}

	public void setcSeq(int cSeq) {
		this.cSeq = cSeq;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getAccept() {
		return accept;
	}

	public void setAccept(int accept) {
		this.accept = accept;
	}

	public int getDelmem() {
		return delmem;
	}

	public void setDelmem(int delmem) {
		this.delmem = delmem;
	}

	public int getCancel() {
		return cancel;
	}

	public void setCancel(int cancel) {
		this.cancel = cancel;
	}

	public int getCvSeq() {
		return cvSeq;
	}

	public void setCvSeq(int cvSeq) {
		this.cvSeq = cvSeq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "CvReqDto [seq=" + seq + ", pSeq=" + pSeq + ", cSeq=" + cSeq + ", rdate=" + rdate + ", comment="
				+ comment + ", accept=" + accept + ", delmem=" + delmem + ", cancel=" + cancel + ", cvSeq=" + cvSeq
				+ ", name=" + name + ", open=" + open + "]";
	}

	

}