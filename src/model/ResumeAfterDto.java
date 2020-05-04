package model;

/*
 CREATE TABLE RESUME_AFTER
(
    `SEQ`         INT              NOT NULL    AUTO_INCREMENT COMMENT '이력서 시퀀스 번호', 
    `MEMSEQ`      INT              NULL        COMMENT '이력서 쓴 유저 시퀀스', 
    `JOBSEQ`      INT              NULL        COMMENT '지원한 채용공고 시퀀스', 
    `COMSEQ`      INT              NULL        COMMENT '열람기업시퀀스', 
    `NAME`        VARCHAR(200)     NULL        COMMENT '이력서명', 
    `USERNAME`    VARCHAR(200)     NULL        COMMENT '지원자이름', 
    `PHONE`       VARCHAR(200)     NULL        COMMENT '연락처', 
    `EMAIL`       VARCHAR(100)     NULL        COMMENT '지원자 이메일', 
    `INTRODUCE`   VARCHAR(2000)    NULL        COMMENT '자기소개', 
    `WDATE`       DATE             NULL        COMMENT '작성 날짜', 
    `WHOSE`       INT              NULL        COMMENT '요청/지원 구분 (0:일반이 지원, 1:기업이 요청)', 
    `MAINRESUME`  INT              NULL        COMMENT '대표 이력서 설정', 
    `DEL`         INT              NULL        COMMENT '삭제여부', 
    `OPEN`        INT              NULL        COMMENT '열람여부 (0:미열람, 1:열람)', 
    PRIMARY KEY (SEQ)
);
 */
public class ResumeAfterDto {
	
	private int seq;			// 이력서 시퀀스 (pk) 
	private int memSeq;			// 이력서 쓴 유저 시퀀스
	private int jobSeq;			// 지원한 공고 시퀀스 
	private int comSeq;			// 회사 시퀀스 
	private String name;		// 이력서명
	private String userName;	// 지원자이름
	private String phone;		// 대표연락처 
	private String email;		// 지원자 이메일 
	private String introduce;	// 내용 : 자기소개 	
	private String wDate;		// 작성 날짜 
	private int whose;			// 작성 상태 (0:일반회원이 지원 , 1:기업이 요청) 	
	private int mainResume;		// 대표이력서 = 1	
	private int del;			// 삭제 = 1
	private int open;			// 열람여부 
	private int status;         // 파일, 직접작성 구분 
	
	public ResumeAfterDto() {

	}

	public ResumeAfterDto(int seq, int memSeq, int jobSeq, int comSeq, String name, String userName, String phone,
			String email, String introduce, String wDate, int whose, int mainResume, int del, int open, int status) {
		super();
		this.seq = seq;
		this.memSeq = memSeq;
		this.jobSeq = jobSeq;
		this.comSeq = comSeq;
		this.name = name;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.introduce = introduce;
		this.wDate = wDate;
		this.whose = whose;
		this.mainResume = mainResume;
		this.del = del;
		this.open = open;
		this.status = status;
	}

	
	public ResumeAfterDto(int seq, int memSeq, int jobSeq, int comSeq, String name, String userName, String wDate,
			int whose, int del, int open) {
		super();
		this.seq = seq;
		this.memSeq = memSeq;
		this.jobSeq = jobSeq;
		this.comSeq = comSeq;
		this.name = name;
		this.userName = userName;
		this.wDate = wDate;
		this.whose = whose;
		this.del = del;
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

	public int getJobSeq() {
		return jobSeq;
	}

	public void setJobSeq(int jobSeq) {
		this.jobSeq = jobSeq;
	}

	public int getComSeq() {
		return comSeq;
	}

	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
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

	public int getWhose() {
		return whose;
	}

	public void setWhose(int whose) {
		this.whose = whose;
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ResumeAfterDto [seq=" + seq + ", memSeq=" + memSeq + ", jobSeq=" + jobSeq + ", comSeq=" + comSeq
				+ ", name=" + name + ", userName=" + userName + ", phone=" + phone + ", email=" + email + ", introduce="
				+ introduce + ", wDate=" + wDate + ", whose=" + whose + ", mainResume=" + mainResume + ", del=" + del
				+ ", open=" + open + ", status=" + status + "]";
	}
	
}
