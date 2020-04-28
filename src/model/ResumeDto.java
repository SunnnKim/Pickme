package model;

/*
CREATE TABLE RESUME
(
    `SEQ`         INT              NOT NULL    AUTO_INCREMENT COMMENT '이력서 시퀀스 번호', 
    `MEMSEQ`      INT              NULL        COMMENT '이력서 쓴 유저 시퀀스', 
    `NAME`        VARCHAR(200)     NULL        COMMENT '이력서명', 
    `USERNAME`    VARCHAR(200)     NULL        COMMENT '지원자이름', 
    `PHONE`       VARCHAR(200)     NULL        COMMENT '연락처', 
    `EMAIL`       VARCHAR(100)     NULL        COMMENT '지원자 이메일', 
    `INTRODUCE`   VARCHAR(2000)    NULL        COMMENT '자기소개', 
    `WDATE`       DATE             NULL        COMMENT '작성 날짜', 
    `STATUS`      INT              NULL        COMMENT '작성 상태', 
    `MAINRESUME`  INT              NULL        COMMENT '대표 이력서 설정', 
    `DEL`         INT              NULL        COMMENT '삭제여부', 
    PRIMARY KEY (SEQ)
);

ALTER TABLE RESUME COMMENT '이력서 관리 테이블';
*/
public class ResumeDto {
	
	private int seq;			// 이력서 시퀀스 (pk) 
	private int memSeq;			// 이력서 쓴 유저 시퀀스
	private String name;		// 이력서명
	private String userName;	// 지원자이름
	private String phone;		// 대표연락처 
	private String email;		// 지원자 이메일 
	private String introduce;	// 내용 : 자기소개 	
	private String wDate;		// 작성 날짜 
	private int status;			// 작성 상태 (0:작성중, 1:작성완료 , 2:첨부완료) 	
	private int mainResume;		// 대표이력서 = 1	
	private int del;			// 삭제여부 = 1
	
	
	public ResumeDto() {

	}
	
	
	
	public ResumeDto(int seq, int memSeq, String name, String userName, String phone, String email, String introduce,
			String wDate, int status, int mainResume, int del) {
		super();
		this.seq = seq;
		this.memSeq = memSeq;
		this.name = name;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.introduce = introduce;
		this.wDate = wDate;
		this.status = status;
		this.mainResume = mainResume;
		this.del = del;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	
	@Override
	public String toString() {
		return "ResumeDto [seq=" + seq + ", memSeq=" + memSeq + ", name=" + name + ", userName=" + userName + ", phone="
				+ phone + ", email=" + email + ", introduce=" + introduce + ", wDate=" + wDate + ", status=" + status
				+ ", mainResume=" + mainResume + ", del=" + del + "]";
	}
	
	
	
	
	
	
	

	
	
}
