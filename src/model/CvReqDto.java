package model;

public class CvReqDto {

	
	private int seq;
	private int jobSeq;
	private int memSeq;
	private String adate;
	private int open;
	private int cancel;
	private String resumePath;
	private String resumeName;
	private int mainResume;
	
	
	public CvReqDto() {
		
	}


	public CvReqDto(int seq, int jobSeq, int memSeq, String adate, int open, int cancel, String resumePath,
			String resumeName, int mainResume) {
		super();
		this.seq = seq;
		this.jobSeq = jobSeq;
		this.memSeq = memSeq;
		this.adate = adate;
		this.open = open;
		this.cancel = cancel;
		this.resumePath = resumePath;
		this.resumeName = resumeName;
		this.mainResume = mainResume;
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


	public void setJob_seq(int jobSeq) {
		this.jobSeq = jobSeq;
	}


	public int getMemSeq() {
		return memSeq;
	}


	public void setMem_seq(int memSeq) {
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


	public String getResumePath() {
		return resumePath;
	}


	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}


	public String getResumeName() {
		return resumeName;
	}


	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}


	public int getMainResume() {
		return mainResume;
	}


	public void setMainResume(int mainResume) {
		this.mainResume = mainResume;
	}


	@Override
	public String toString() {
		return "CvReqDto [seq=" + seq + ", jobSeq=" + jobSeq + ", memSeq=" + memSeq + ", adate=" + adate + ", open="
				+ open + ", cancel=" + cancel + ", resumePath=" + resumePath + ", resumeName=" + resumeName
				+ ", mainResume=" + mainResume + "]";
	}
	
	
}
