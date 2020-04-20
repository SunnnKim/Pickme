package model;

public class CvReqDto {

	private int seq;
	private int pSeq;
	private int cSeq;
	private String rdate;
	private String comment;
	private int accept;
	private int del;
	private int cancel;
	private int cvSeq;
	private String name;
	private int status; // 요청 수락한 이력서 오픈 상태
	
	public CvReqDto() {
		
	}

	public CvReqDto(int seq, int pSeq, int cSeq, String rdate, String comment, int accept, int del, int cancel,
			int cvSeq, String name, int status) {
		super();
		this.seq = seq;
		this.pSeq = pSeq;
		this.cSeq = cSeq;
		this.rdate = rdate;
		this.comment = comment;
		this.accept = accept;
		this.del = del;
		this.cancel = cancel;
		this.cvSeq = cvSeq;
		this.name = name;
		this.status = status;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CvReqDto [seq=" + seq + ", pSeq=" + pSeq + ", cSeq=" + cSeq + ", rdate=" + rdate + ", comment="
				+ comment + ", accept=" + accept + ", del=" + del + ", cancel=" + cancel + ", cvSeq=" + cvSeq
				+ ", name=" + name + ", status=" + status + "]";
	}

	

}