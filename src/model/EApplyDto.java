package model;

public class EApplyDto {

	private int seq;		  // 시퀀스
	private int jobSeq;		  // 채용공고 시퀀스 	
	private int comSeq;       // 기업 시퀀스 
	private String comName;   // 기업 이름 
	private int memSeq;       // 개인 시퀀스 
	private String adate;	  // 지원일	
	private int open;         // 열람여부 
	private int cancel;		  // 지원취소(담당자 미열람시) 	
	private int cvSeq;        // 지원한 이력서 seq
	private int del;		  // 삭제여부(기업) 	
	private int delMem;		  // 삭제여부(개인)	
	private String comJob1;   // 직군 
	private String comJob2;   // 직무 
	private String edate;	  // 채용공고 마감일 	
	

	public EApplyDto() {
		
	}


	public EApplyDto(int seq, int jobSeq, int comSeq, String comName, int memSeq, String adate, int open, int cancel,
			int cvSeq, int del, int delMem, String comJob1, String comJob2, String edate) {
		super();
		this.seq = seq;
		this.jobSeq = jobSeq;
		this.comSeq = comSeq;
		this.comName = comName;
		this.memSeq = memSeq;
		this.adate = adate;
		this.open = open;
		this.cancel = cancel;
		this.cvSeq = cvSeq;
		this.del = del;
		this.delMem = delMem;
		this.comJob1 = comJob1;
		this.comJob2 = comJob2;
		this.edate = edate;
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


	public String getAdate() {
		return adate;
	}


	public void setAdate(String adate) {
		this.adate = adate;
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


	public int getDelMem() {
		return delMem;
	}


	public void setDelMem(int delMem) {
		this.delMem = delMem;
	}


	public String getComJob1() {
		return comJob1;
	}


	public void setComJob1(String comJob1) {
		this.comJob1 = comJob1;
	}


	public String getComJob2() {
		return comJob2;
	}


	public void setComJob2(String comJob2) {
		this.comJob2 = comJob2;
	}


	public String getEdate() {
		return edate;
	}


	public void setEdate(String edate) {
		this.edate = edate;
	}


	@Override
	public String toString() {
		return "EApplyDto [seq=" + seq + ", jobSeq=" + jobSeq + ", comSeq=" + comSeq + ", comName=" + comName
				+ ", memSeq=" + memSeq + ", adate=" + adate + ", open=" + open + ", cancel=" + cancel + ", cvSeq="
				+ cvSeq + ", del=" + del + ", delMem=" + delMem + ", comJob1=" + comJob1 + ", comJob2=" + comJob2
				+ ", edate=" + edate + "]";
	}

		

}	