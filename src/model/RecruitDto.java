package model;

import java.io.Serializable;

/*
CREATE TABLE RECRUIT
(
    `SEQ`           INT              NOT NULL    AUTO_INCREMENT COMMENT '시퀀스번호', 
    `COM_SEQ`       INT              NULL        COMMENT '회사SEQ', 
    `TITLE`         VARCHAR(200)     NULL        COMMENT '제목', 
    `COM_JOB`       VARCHAR(500)     NULL        COMMENT '채용직무', 
    `COM_JOBTYPE`   VARCHAR(100)     NULL        COMMENT '채용포지션(신입/경력)', 
    `MAIN_TASK`     VARCHAR(1000)    NULL        COMMENT '주요업무', 
    `WORKING_FORM`  VARCHAR(100)     NULL        COMMENT '근무형태(정규직계약직)', 
    `REQUIREMENTS`  VARCHAR(500)     NULL        COMMENT '자격요건(학력스킬등)', 
    `SALARY`        VARCHAR(500)     NULL        COMMENT '급여', 
    `CONTENT`       LONGTEXT         NULL        COMMENT '내용', 
    `HASHTAG`       VARCHAR(2000)    NULL        COMMENT '해쉬태그', 
    `WDATE`         DATE             NULL        COMMENT '등록일', 
    `EDATE`         DATE             NULL        COMMENT '마감일', 
    `REF`           INT              NULL        COMMENT '그룹번호(파일)', 
    `READCOUNT`     INT              NULL        COMMENT '조회수', 
    `DEL`           INT              NULL        COMMENT '삭제여부(0등록1삭제)', 
    PRIMARY KEY (SEQ)
);
 */
public class RecruitDto implements Serializable {
	
	private int seq;
	private int comSeq;
	private String title;
	private String comJob;
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
	
	public RecruitDto() {
		
	}
	

	public RecruitDto(int comSeq, String title, String comJob, String comJobType, String mainTask, String workingForm,
			String requirements, String salary, String content, String hashTag, String edate, int ref) {
		super();
		this.comSeq = comSeq;
		this.title = title;
		this.comJob = comJob;
		this.comJobType = comJobType;
		this.mainTask = mainTask;
		this.workingForm = workingForm;
		this.requirements = requirements;
		this.salary = salary;
		this.content = content;
		this.hashTag = hashTag;
		this.edate = edate;
		this.ref = ref;
	}

	public RecruitDto(int seq, int comSeq, String title, String comJob, String comJobType, String mainTask,
			String workingForm, String requirements, String salary, String content, String hashTag, String wdate,
			String edate, int ref, int readCount, int del) {
		super();
		this.seq = seq;
		this.comSeq = comSeq;
		this.title = title;
		this.comJob = comJob;
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

	public String getComJob() {
		return comJob;
	}

	public void setComJob(String comJob) {
		this.comJob = comJob;
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
		return "RecruitDto [seq=" + seq + ", comSeq=" + comSeq + ", title=" + title + ", comJob=" + comJob
				+ ", comJobType=" + comJobType + ", mainTask=" + mainTask + ", workingForm=" + workingForm
				+ ", requirements=" + requirements + ", salary=" + salary + ", content=" + content + ", hashTag="
				+ hashTag + ", wdate=" + wdate + ", edate=" + edate + ", ref=" + ref + ", readCount=" + readCount
				+ ", del=" + del + "]";
	}
	
	
	
	

	
}
