package model;

public class ApplyDto {

	private int seq;
	private int job_seq;
	private int mem_seq;
	private String adate;
	private int open;
	private int cancel;
	private String resumePath;
	private String resumeName;
	private int mainResume;
	
	
	public ApplyDto() {
	}
	
	
	public ApplyDto(int seq, int job_seq, int mem_seq, String adate, int open, int cancel, String resumePath,
			String resumeName, int mainResume) {
		super();
		this.seq = seq;
		this.job_seq = job_seq;
		this.mem_seq = mem_seq;
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
	public int getJob_seq() {
		return job_seq;
	}
	public void setJob_seq(int job_seq) {
		this.job_seq = job_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
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
		return "ApplyDto [seq=" + seq + ", job_seq=" + job_seq + ", mem_seq=" + mem_seq + ", adate=" + adate + ", open="
				+ open + ", cancel=" + cancel + ", resumePath=" + resumePath + ", resumeName=" + resumeName
				+ ", mainResume=" + mainResume + "]";
	}
	
	
	
}
