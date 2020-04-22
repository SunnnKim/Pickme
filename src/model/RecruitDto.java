package model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/*
CREATE TABLE RECRUIT
(
    `SEQ`           INT              NOT NULL    AUTO_INCREMENT COMMENT '시퀀스번호', 
    `COMSEQ`        INT              NULL        COMMENT '회사SEQ', 
    `COMNAME`       VARCHAR(500)     NULL        COMMENT '회사이름', 
    `TITLE`         VARCHAR(200)     NULL        COMMENT '제목', 
    `COMJOB1`       VARCHAR(50)      NULL        COMMENT '직군', 
    `COMJOB2`       VARCHAR(50)      NULL        COMMENT '직무', 
    `COMJOBTYPE`    VARCHAR(100)     NULL        COMMENT '채용포지션(신입/경력)', 
    `MAINTASK`      VARCHAR(1000)    NULL        COMMENT '주요업무', 
    `WORKINGFORM`   VARCHAR(100)     NULL        COMMENT '근무형태(정규직계약직)', 
    `REQUIREMENTS`  VARCHAR(500)     NULL        COMMENT '자격요건(학력스킬등)', 
    `SALARY`        VARCHAR(500)     NULL        COMMENT '급여', 
    `CONTENT`       LONGTEXT         NULL        COMMENT '내용', 
    `HASHTAG`       VARCHAR(2000)    NULL        COMMENT '해쉬태그', 
    `WDATE`         DATE             NULL        COMMENT '등록일', 
    `EDATE`         DATE             NULL        COMMENT '마감일', 
    `REF`           INT              NULL        COMMENT '그룹번호(파일)', 
    `READCOUNT`     INT              NULL        COMMENT '조회수', 
    `IMAGENAME`     VARCHAR(100)     NULL        COMMENT '대표이미지이름', 
    `DEL`           INT              NULL        COMMENT '삭제여부(0등록1삭제)', 
    PRIMARY KEY (SEQ)
);

ALTER TABLE RECRUIT COMMENT '채용관리';
 */

public class RecruitDto implements Serializable {
	
	private int seq;
	private int comSeq;
	private String comName;
	private String title;
	private String comJob1;
	private String comJob2;
	private String comJobType;
	private String mainTask;
	private String workingForm;
	private String requirements;
	private String salary;
	private String content;
	private String hashTag;
	private String wdate;
	private String edate;
	private int ref;
	private int readCount;
	private int del;
	private String imagename;
	private int applyCount;
	
	public RecruitDto() {
		
	}
	

	public RecruitDto(int seq, int comSeq, String comName, String title, String comJob1,String comJob2, String comJobType, String mainTask,
			String workingForm, String requirements, String salary, String content, String hashTag, String wdate,
			String edate, int ref, int del, String imagename) {
		super();
		this.seq = seq;
		this.comSeq = comSeq;
		this.comName = comName;
		this.title = title;
		this.comJob1 = comJob1;
		this.comJob2 = comJob2;
		this.comJobType = comJobType;
		this.mainTask = mainTask;
		this.workingForm = workingForm;
		this.requirements = requirements;
		this.salary = salary;
		this.content = content;
		this.hashTag = hashTag;
		this.wdate = wdate;
		this.edate = edate;
		this.ref = ref;
		this.del = del;
		this.imagename = imagename;
	}

	

	public RecruitDto(int seq, int comSeq, String comName, String title, String comJob1, String comJob2, String comJobType,
			String mainTask, String workingForm, String requirements, String salary, String content, String hashTag,
			String wdate, String edate, int ref, int readCount, int del, String imagename, int applyCount) {
		super();
		this.seq = seq;
		this.comSeq = comSeq;
		this.comName = comName;
		this.title = title;
		this.comJob1 = comJob1;
		this.comJob2 = comJob2;
		this.comJobType = comJobType;
		this.mainTask = mainTask;
		this.workingForm = workingForm;
		this.requirements = requirements;
		this.salary = salary;
		this.content = content;
		this.hashTag = hashTag;
		this.wdate = wdate;
		this.edate = edate;
		this.ref = ref;
		this.readCount = readCount;
		this.del = del;
		this.imagename = imagename;
		this.applyCount = applyCount;
	}


	public RecruitDto(int comSeq, String comName, String title, String comJob1, String comJob2,String comJobType, String mainTask,
			String workingForm, String requirements, String salary, String content, String hashTag, String edate,
			int ref, String imagename) {
		super();
		this.comSeq = comSeq;
		this.comName = comName;
		this.title = title;
		this.comJob1 = comJob1;
		this.comJob2 = comJob2;
		this.comJobType = comJobType;
		this.mainTask = mainTask;
		this.workingForm = workingForm;
		this.requirements = requirements;
		this.salary = salary;
		this.content = content;
		this.hashTag = hashTag;
		this.edate = edate;
		this.ref = ref;
		this.imagename = imagename;
	}

	

	public int getApplyCount() {
		return applyCount;
	}


	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}


	public String getComName() {
		return comName;
	}


	public void setComName(String comName) {
		this.comName = comName;
	}


	public String getImagename() {
		return imagename;
	}


	public void setImagename(String imagename) {
		this.imagename = imagename;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getComSeq() {
		return comSeq;
	}

	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public String getComJob1() {
		return comJob1;
	}


	public void setComJob1(String comJob1) {
		this.comJob1 = comJob1;
	}


	public String getComJob2() {
		return comJob2;
	}


	public void setComJob2(String comJob2) {
		this.comJob2 = comJob2;
	}


	public String getComJobType() {
		return comJobType;
	}

	public void setComJobType(String comJobType) {
		this.comJobType = comJobType;
	}

	public String getMainTask() {
		return mainTask;
	}

	public void setMainTask(String mainTask) {
		this.mainTask = mainTask;
	}

	public String getWorkingForm() {
		return workingForm;
	}

	public void setWorkingForm(String workingForm) {
		this.workingForm = workingForm;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "RecruitDto [seq=" + seq + ", comSeq=" + comSeq + ", comName=" + comName + ", title=" + title
				+ ", comJob1=" + comJob1 + ", comJob2=" + comJob2 + ", comJobType=" + comJobType + ", mainTask="
				+ mainTask + ", workingForm=" + workingForm + ", requirements=" + requirements + ", salary=" + salary
				+ ", content=" + content + ", hashTag=" + hashTag + ", wdate=" + wdate + ", edate=" + edate + ", ref="
				+ ref + ", readCount=" + readCount + ", del=" + del + ", imagename=" + imagename + "]";
	}


	

	

	
}
