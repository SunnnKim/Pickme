package model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
/*
 CREATE TABLE FILES
(
    `SEQ`         INT             NOT NULL    AUTO_INCREMENT COMMENT '시퀀스번호', 
    `USETABLE`    VARCHAR(100)    NULL        COMMENT '파일사용테이블', 
    `ORIGINNAME`  VARCHAR(100)    NULL        COMMENT '오리지널파일이름', 
    `NEWNAME`     VARCHAR(100)    NULL        COMMENT '새로운 파일이름', 
    `PATH`        VARCHAR(500)    NULL        COMMENT '경로(파일들어있는 폴더,/이름으로 표시)', 
    `DEL`         INT             NULL        COMMENT '삭제여부', 
    `REF`         INT             NULL        COMMENT '그룹파일번호', 
    `STEP`        INT             NULL        COMMENT '그룹내 파일번호', 
    `FILETYPE`    VARCHAR(45)     NULL        COMMENT '파일종류(IMAGE / FILE)', 
    PRIMARY KEY (SEQ)
); 
  */

public class FilesDto implements Serializable {
	private int seq;
	private String usetable;
	private String originname;
	private String newname;
	private String path;
	private int del;
	private int ref;
	private int step;
	private String filetype;
	
	public FilesDto() {
		
	}
	

	public FilesDto(String originname, String newname, String filetype) {
		super();
		this.originname = originname;
		this.newname = newname;
		this.filetype = filetype;
	}

	public FilesDto(int seq, String usetable, String originname, String newname, String path, int del, int ref,
			int step, String filetype) {
		super();
		this.seq = seq;
		this.usetable = usetable;
		this.originname = originname;
		this.newname = newname;
		this.path = path;
		this.del = del;
		this.ref = ref;
		this.step = step;
		this.filetype = filetype;
	}
	
	
	public FilesDto(String originname, String newname, String path, int ref, int step, String filetype) {
		super();
		this.originname = originname;
		this.newname = newname;
		this.path = path;
		this.ref = ref;
		this.step = step;
		this.filetype = filetype;
	}
	

	public FilesDto(String originname, String newname, int ref, int step, String filetype) {
		super();
		this.originname = originname;
		this.newname = newname;
		this.ref = ref;
		this.step = step;
		this.filetype = filetype;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUsetable() {
		return usetable;
	}

	public void setUsetable(String usetable) {
		this.usetable = usetable;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getNewname() {
		return newname;
	}

	public void setNewname(String newname) {
		this.newname = newname;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	@Override
	public String toString() {
		return "FilesDto [seq=" + seq + ", usetable=" + usetable + ", originname=" + originname + ", newname=" + newname
				+ ", path=" + path + ", del=" + del + ", ref=" + ref + ", step=" + step + ", filetype=" + filetype + "]";
	}
	
	
}
