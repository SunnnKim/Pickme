package model;

public class QuestionDto {
		
	private int seq;
	private String email;
	private String title;
	private String content;
	private String reply;
	private String wDate;
	private String rDate;
	private int del;
	private String type;
	
	// 통계용 변수
	private long statNum;
	private String statStr; 
	
	public QuestionDto() {
		// TODO Auto-generated constructor stub
	}

	public QuestionDto(int seq, String email, String title, String content, String reply, String wDate, String rDate,
			int del, String type, long statNum, String statStr) {
		super();
		this.seq = seq;
		this.email = email;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.wDate = wDate;
		this.rDate = rDate;
		this.del = del;
		this.type = type;
		this.statNum = statNum;
		this.statStr = statStr;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getStatNum() {
		return statNum;
	}

	public void setStatNum(long statNum) {
		this.statNum = statNum;
	}

	public String getStatStr() {
		return statStr;
	}

	public void setStatStr(String statStr) {
		this.statStr = statStr;
	}

	@Override
	public String toString() {
		return "QuestionDto [seq=" + seq + ", email=" + email + ", title=" + title + ", content=" + content + ", reply="
				+ reply + ", wDate=" + wDate + ", rDate=" + rDate + ", del=" + del + ", type=" + type + ", statNum="
				+ statNum + ", statStr=" + statStr + "]";
	}
	
	
}
