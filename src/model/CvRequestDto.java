package model;

public class CvRequestDto {

	private int seq;			// 시퀀스
	private String name;		// 구직자명 / 기업명
	
	private String rdate;		// 이력서 열람요청 날짜
	private String comment;		// 기업 코멘트
	private int accept;			// 수락여부(0:대기, 1:수락, 2:거절)
	private int state;			// 상태 ( ) 
	private int del;			// 삭제여부 (0:등록, 1:삭제)
	private String ddate;		// 삭제일
	
	public CvRequestDto() {
		// TODO Auto-generated constructor stub
	}

	
	public CvRequestDto(int seq, String name, String rdate, String comment, int accept, int state, int del,
			String ddate) {
		super();
		this.seq = seq;
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "CvRequestDto [seq=" + seq + ", name=" + name + ", rdate=" + rdate + ", comment=" + comment + ", accept="
				+ accept + ", state=" + state + ", del=" + del + ", ddate=" + ddate + "]";
	}
	
	
	
}
