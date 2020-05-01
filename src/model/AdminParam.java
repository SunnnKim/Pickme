package model;

public class AdminParam {

	private int seq;
	private int memSeq;
	private String username;
	private int status;
	private String resumeName;
	private String wDate;
	private int mainResume;
	private int del;
	
	// 채용공고용
	private String comName;
	private int whose;
	private int open;

	public AdminParam() {
		// TODO Auto-generated constructor stub
	}

	public AdminParam(int seq, int memSeq, String username, int status, String resumeName, String wDate, int mainResume,
			int del, String comName, int whose, int open) {
		super();
		this.seq = seq;
		this.memSeq = memSeq;
		this.username = username;
		this.status = status;
		this.resumeName = resumeName;
		this.wDate = wDate;
		this.mainResume = mainResume;
		this.del = del;
		this.comName = comName;
		this.whose = whose;
		this.open = open;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public int getMainResume() {
		return mainResume;
	}

	public void setMainResume(int mainResume) {
		this.mainResume = mainResume;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getWhose() {
		return whose;
	}

	public void setWhose(int whose) {
		this.whose = whose;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "AdminParam [seq=" + seq + ", memSeq=" + memSeq + ", username=" + username + ", status=" + status
				+ ", resumeName=" + resumeName + ", wDate=" + wDate + ", mainResume=" + mainResume + ", del=" + del
				+ ", comName=" + comName + ", whose=" + whose + ", open=" + open + "]";
	}

	
	
	
	
	
}
