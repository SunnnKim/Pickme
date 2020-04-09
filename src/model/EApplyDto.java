package model;

public class EApplyDto {

	private int seq;
	private int jobSeq;
	private int memSeq;
	private String adate;
	private int open;
	private int cancel;
	private String resumePath;
	private String resumeName;
	private int mainResume;
	private String name; // 기업이름
	private String edate;
	

	public EApplyDto() {
		
	}


	public EApplyDto(int seq, int jobSeq, int memSeq, String adate, int open, int cancel, String resumePath,
			String resumeName, int mainResume, String name, String edate) {
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
		this.name = name;
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
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	

	public String getEdate() {
		return edate;
	}


	public void setEdate(String edate) {
		this.edate = edate;
	}


	@Override
	public String toString() {
		return "ApplyDto [seq=" + seq + ", jobSeq=" + jobSeq + ", memSeq=" + memSeq + ", adate=" + adate + ", open="
				+ open + ", cancel=" + cancel + ", resumePath=" + resumePath + ", resumeName=" + resumeName
				+ ", mainResume=" + mainResume + ", name=" + name + ", memSeq" + memSeq + "]";
	}
	
	
	
}
