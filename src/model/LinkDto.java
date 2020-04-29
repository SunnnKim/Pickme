package model;

/*
 
	CREATE TABLE LINK
	(
	    `RSMSEQ`  INT              NULL        COMMENT '이력서 시퀀스', 
	    `URL`     VARCHAR(2000)    NULL        COMMENT 'URL'
	);
	
	ALTER TABLE LINK COMMENT '이력서 링크 테이블';

*/
public class LinkDto {
	
	int rsmseq;		//이력서 시퀀스
	String url; 	// URL

	public LinkDto() {
		
	}

	public LinkDto(int rsmseq, String url) {
		super();
		this.rsmseq = rsmseq;
		this.url = url;
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
		return "LinkDto [rsmseq=" + rsmseq + ", url=" + url + "]";
	}
	
	
	
	
	
	
	
	
}
