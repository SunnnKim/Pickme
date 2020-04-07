package model;

public class MessageDto {

	
	private int seq;
	private String content;
	private int from;
	private String name;
	private int to;
	private String sdate;
	private int open;
	private int del;
	private int important;
	private String distinguish;
	
	public MessageDto(){
		
	}

	public MessageDto(int seq, String content, int from, String name, int to, String sdate, int open, int del,
			int important, String distinguish) {
		super();
		this.seq = seq;
		this.content = content;
		this.from = from;
		this.name = name;
		this.to = to;
		this.sdate = sdate;
		this.open = open;
		this.del = del;
		this.important = important;
		this.distinguish = distinguish;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getDistinguish() {
		return distinguish;
	}

	public void setDistinguish(String distinguish) {
		this.distinguish = distinguish;
	}

	@Override
	public String toString() {
		return "MessageDto [seq=" + seq + ", content=" + content + ", from=" + from + ", name=" + name + ", to=" + to
				+ ", sdate=" + sdate + ", open=" + open + ", del=" + del + ", important=" + important + ", distinguish="
				+ distinguish + "]";
	}

		
	
}
	