package model;

/*
 
	CREATE TABLE LINK
	(
		`SEQ`     INT              NOT NULL    AUTO_INCREMENT COMMENT '링크 시퀀스', 
	    `RSMSEQ`  INT              NULL        COMMENT '이력서 시퀀스', 
	    `URL`     VARCHAR(2000)    NULL        COMMENT 'URL',
	    PRIMARY KEY (SEQ)
	);
	
	ALTER TABLE LINK COMMENT '이력서 링크 테이블';

*/
public class LinkDto {
	
	int seq;		// 링크 시퀀스
	int rsmseq;		//이력서 시퀀스
	String url; 	// URL

	public LinkDto() {
		
	}
	

	public LinkDto(int seq, int rsmseq, String url) {
		super();
		this.seq = seq;
		this.rsmseq = rsmseq;
		this.url = url;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	@Override
	public String toString() {
		return "LinkDto [seq=" + seq + ", rsmseq=" + rsmseq + ", url=" + url + "]";
	}

	
	
	
	
	
	
	
	
	
}
