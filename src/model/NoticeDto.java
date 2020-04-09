package model;
/*
CREATE TABLE NOTICE
(
    `SEQ`        INT             NOT NULL    AUTO_INCREMENT COMMENT '시퀀스번호', 
    `TITLE`      VARCHAR(200)    NULL        COMMENT '제목', 
    `CONTENT`    LONGTEXT        NULL        COMMENT '내용', 
    `TYPE`       VARCHAR(45)     NULL        COMMENT '글종류(VOTE/PLANE)', 
    `WDATE`      DATE            NULL        COMMENT '등록일', 
    `DEL`        INT             NULL        COMMENT '삭제여부(0등록1삭제)', 
    `FILES`      INT             NULL        COMMENT '첨부파일여부', 
    `READCOUNT`  INT             NULL        COMMENT '조회수', 
    PRIMARY KEY (SEQ)
);
 */

public class NoticeDto {
	private int seq;
	private String title;
	private String content;
	private String type;
	private String wdate;
	private int del;
	private int files;
	private int readcount;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int seq, String title, String content, String type, String wdate, int del, int files,
			int readcount) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.type = type;
		this.wdate = wdate;
		this.del = del;
		this.files = files;
		this.readcount = readcount;
	}
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getFiles() {
		return files;
	}

	public void setFiles(int files) {
		this.files = files;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "NoticeDto [seq=" + seq + ", title=" + title + ", content=" + content + ", type=" + type + ", wdate="
				+ wdate + ", del=" + del + ", files=" + files + ", readcount=" + readcount + "]";
	}

	
	
	
	
}
