package model;

public class ResumeFileDto {

	private int seq;		 	 // 파일 시퀀스	
	private int rsmSeq;			 // 이력서 시퀀스
	private String originalName; // 원본 파일명
	private String storedName;	 // 저장 파일명
	private String filePath; 	 // 저장 경로
	
	public ResumeFileDto() {
	
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
