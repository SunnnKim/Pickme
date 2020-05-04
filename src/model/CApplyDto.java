package model;

public class CApplyDto {

	private int seq;			// 시퀀스
	private int jobSeq;			// 공고 시퀀스 
	private int comSeq;			// 기업 시퀀스
	private String comName;		// 기업명
	private int memSeq;			// 지원자 시퀀스
	private String aDate;		// 지원날짜
	private int open;			// 인사담당자 확인여부
	private int cancel;			// 지원취소 (0 / 1)
	private int cvSeq;			// 지원한 이력서 시퀀스 (RESUME_AFTER)
	private int del;			// 지원내역 삭제 (0 / 1)
	
	private String memName;		// 구직자 이름
	private String cvName;		// 이력서 제목
	private String profilename;	// 이력서 사진
	
	
	public CApplyDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CApplyDto(int seq, int jobSeq, int comSeq, String comName, int memSeq, String aDate, int open, int cancel,
			int cvSeq, int del, String memName, String cvName, String profilename) {
		super();
		this.seq = seq;
		this.jobSeq = jobSeq;
		this.comSeq = comSeq;
		this.comName = comName;
		this.memSeq = memSeq;
		this.aDate = aDate;
		this.open = open;
		this.cancel = cancel;
		this.cvSeq = cvSeq;
		this.del = del;
		this.memName = memName;
		this.cvName = cvName;
		this.profilename = profilename;
	}



	public String getProfilename() {
		return profilename;
	}

	public void setProfilename(String profilename) {
		this.profilename = profilename;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getCvName() {
		return cvName;
	}

	public void setCvName(String cvName) {
		this.cvName = cvName;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getJobSeq() {
		return jobSeq;
	}

	public void setJobSeq(int jobSeq) {
		this.jobSeq = jobSeq;
	}

	public int getComSeq() {
		return comSeq;
	}

	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "CApplyDto [seq=" + seq + ", jobSeq=" + jobSeq + ", comSeq=" + comSeq + ", comName=" + comName
				+ ", memSeq=" + memSeq + ", aDate=" + aDate + ", open=" + open + ", cancel=" + cancel + ", cvSeq="
				+ cvSeq + ", del=" + del + ", memName=" + memName + ", cvName=" + cvName + ", profilename="
				+ profilename + "]";
	}


	
	
	
	
	
}
