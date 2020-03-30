package model;

public class RequestDto {

	private int seq;
	private int p_seq;
	private int c_seq;
	private String rdate;
	private String comment;
	private int accept;
	private int state;
	private int del;
	private String ddate;
	
	public RequestDto() {
		// TODO Auto-generated constructor stub
	}
	
	public RequestDto(int seq, int p_seq, int c_seq, String rdate, String comment, int accept, int state, int del,
			String ddate) {
		super();
		this.seq = seq;
		this.p_seq = p_seq;
		this.c_seq = c_seq;
		this.rdate = rdate;
		this.comment = comment;
		this.accept = accept;
		this.state = state;
		this.del = del;
		this.ddate = ddate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	@Override
	public String toString() {
		return "RequestDto [seq=" + seq + ", p_seq=" + p_seq + ", c_seq=" + c_seq + ", rdate=" + rdate + ", comment="
				+ comment + ", accept=" + accept + ", state=" + state + ", del=" + del + ", ddate=" + ddate + "]";
	}
	
	
	
}
