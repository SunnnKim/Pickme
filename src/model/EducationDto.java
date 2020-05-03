package model;

/*
 
CREATE TABLE EDUCATION
(
	`SEQ`        INT              NOT NULL    AUTO_INCREMENT COMMENT '학력 시퀀스', 
    `RSMSEQ`     INT              NULL        COMMENT '이력서 시퀀스', 
    `SCHOOL`     VARCHAR(2000)    NULL        COMMENT '학교명', 
    `MAJOR`      VARCHAR(2000)    NULL        COMMENT '전공', 
    `STUDY`      VARCHAR(3000)    NULL        COMMENT '이수과목 또는 연구 내용', 
    `STARTDATE`  VARCHAR(100)     NULL        COMMENT '입학 날짜', 
    `ENDDATE`    VARCHAR(100)     NULL        COMMENT '졸업 날짜', 
    `ING`        VARCHAR(200)     NULL        COMMENT '현재 재학중 (0 졸업, 1 재학중 )',
    PRIMARY KEY (SEQ)
);

ALTER TABLE EDUCATION COMMENT '이력서 학력 테이블';
 
*/

public class EducationDto {
	
	int seq; 			// 학력 시퀀스
	int rsmseq;			// 이력서 시퀀스
	String school;		// 학교명
	String major;		// 전공
	String study;		// 이수과목 또는 연구 내용
	String startdate;	// 입학 날짜
	String enddate;		// 졸업 날짜
	String ing;			// 현재 재학중 (0 졸업, 1 재학중 )
	
	
	public EducationDto() {
		
	}
	
	
	
	public EducationDto(int seq, int rsmseq, String school, String major, String study, String startdate,
			String enddate, String ing) {
		super();
		this.seq = seq;
		this.rsmseq = rsmseq;
		this.school = school;
		this.major = major;
		this.study = study;
		this.startdate = startdate;
		this.enddate = enddate;
		this.ing = ing;
	}

	

	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getRsmseq() {
		return rsmseq;
	}
	
	public void setRsmseq(int rsmseq) {
		this.rsmseq = rsmseq;
	}
	
	public String getSchool() {
		return school;
	}
	
	public void setSchool(String school) {
		this.school = school;
	}
	
	public String getMajor() {
		return major;
	}
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getStudy() {
		return study;
	}
	public void setStudy(String study) {
		this.study = study;
	}
	
	public String getStartdate() {
		return startdate;
	}
	
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	
	public String getEnddate() {
		return enddate;
	}
	
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	public String getIng() {
		return ing;
	}
	
	public void setIng(String ing) {
		this.ing = ing;
	}



	@Override
	public String toString() {
		return "EducationDto [seq=" + seq + ", rsmseq=" + rsmseq + ", school=" + school + ", major=" + major
				+ ", study=" + study + ", startdate=" + startdate + ", enddate=" + enddate + ", ing=" + ing + "]";
	}
	
	
	
	

}
