package model;

public class CvRequestDto {

	private int seq;			// delete에 사용할 request 시퀀스
	private String pEmail;		// CV_COMPANY에서 이력서 찾기 위해 사용
	private String email;		// favorite에 넣을 기업 email 가져오려고 사용
	private int pseq;			// favorite에 넣을 구직자 seq 
	private String name;		// 구직자명 / 기업명
	private String rdate;		// 이력서 열람요청 날짜
	private String comment;		// 기업 코멘트
	private int accept;			// 수락여부(0:대기, 1:수락, 2:거절)
	private int state;			// 상태 ( ) 
	private int del;			// 삭제여부 (0:등록, 1:삭제)
	private int likePick;		// 관심인재 여부 (0:해제, 1:선택)
	private String ddate;		// 삭제일
	
	
	
	private int cvSeq;			// 제출한 이력서 seq
	private int comSeq;			// CV_COMPANY에서 이력서 찾기 위해 사용(세션에서 저장)
	
	public CvRequestDto() {
		// TODO Auto-generated constructor stub
	}
	



	


	public CvRequestDto(int seq, String pEmail, String email, int pseq, String name, String rdate, String comment,
			int accept, int state, int del, int likePick, String ddate, int cvSeq, int comSeq) {
		super();
		this.seq = seq;
		this.pEmail = pEmail;
		this.email = email;
		this.pseq = pseq;
		this.name = name;
		this.rdate = rdate;
		this.comment = comment;
		this.accept = accept;
		this.state = state;
		this.del = del;
		this.likePick = likePick;
		this.ddate = ddate;
		this.cvSeq = cvSeq;
		this.comSeq = comSeq;
	}







	public int getComSeq() {
		return comSeq;
	}







	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}







	public String getpEmail() {
		return pEmail;
	}





	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}





	public int getCvSeq() {
		return cvSeq;
	}



	public void setCvSeq(int cvSeq) {
		this.cvSeq = cvSeq;
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

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
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

	public int getLikePick() {
		return likePick;
	}

	public void setLikePick(int likePick) {
		this.likePick = likePick;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}







	@Override
	public String toString() {
		return "CvRequestDto [seq=" + seq + ", pEmail=" + pEmail + ", email=" + email + ", pseq=" + pseq + ", name="
				+ name + ", rdate=" + rdate + ", comment=" + comment + ", accept=" + accept + ", state=" + state
				+ ", del=" + del + ", likePick=" + likePick + ", ddate=" + ddate + ", cvSeq=" + cvSeq + ", comSeq="
				+ comSeq + "]";
	}






	

	
}
