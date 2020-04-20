package model;

public class EApplyDto {

	private int seq;
	private int jobSeq;
	private int comSeq;
	private String comName;
	private int memSeq;
	private String adate;
	private int open;
	private int cancel;
	private int cvSeq;
	private int del;
	private String comJob;
	private String edate;
	
	

	public EApplyDto() {
		
	}



	public EApplyDto(int seq, int jobSeq, int comSeq, String comName, int memSeq, String adate, int open, int cancel,
			int cvSeq, int del, String comJob, String edate) {
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
		this.comJob = comJob;
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



	public String getComJob() {
		return comJob;
	}



	public void setComJob(String comJob) {
		this.comJob = comJob;
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
				+ cvSeq + ", del=" + del + ", comJob=" + comJob + ", edate=" + edate + "]";
	}


	

}	