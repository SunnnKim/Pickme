package model;

public class ResumeFileDto {

	private int seq;
	private int rsmSeq;
	private String originalName;
	private String storedName;
	private String filePath;
	
	public ResumeFileDto() {
		// TODO Auto-generated constructor stub
	}

	public ResumeFileDto(int seq, int rsmSeq, String originalName, String storedName, String filePath) {
		super();
		this.seq = seq;
		this.rsmSeq = rsmSeq;
		this.originalName = originalName;
		this.storedName = storedName;
		this.filePath = filePath;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getRsmSeq() {
		return rsmSeq;
	}

	public void setRsmSeq(int rsmSeq) {
		this.rsmSeq = rsmSeq;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ResumeFileDto [seq=" + seq + ", rsmSeq=" + rsmSeq + ", originalName=" + originalName + ", storedName="
				+ storedName + ", filePath=" + filePath + "]";
	}
	
	
}
