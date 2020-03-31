package model;

public class MessageDto {

	
	private int seq;
	private String content;
	private int from;
	private int to;
	private String sdate;
	private int open;
	private int del;
	private int important;
	
	public MessageDto(){
		
	}

	public MessageDto(int seq, String content, int from, int to, String sdate, int open, int del, int important) {
		super();
		this.seq = seq;
		this.content = content;
		this.from = from;
		this.to = to;
		this.sdate = sdate;
		this.open = open;
		this.del = del;
		this.important = important;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getTo() {
		return to;
	}

	public void setTo(int to) {
		this.to = to;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}

	@Override
	public String toString() {
		return "MessageDto [seq=" + seq + ", content=" + content + ", from=" + from + ", to=" + to + ", sdate=" + sdate
				+ ", open=" + open + ", del=" + del + ", important=" + important + "]";
	}
	
}
