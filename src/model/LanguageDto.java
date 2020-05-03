package model;
/*
CREATE TABLE LANGUAGE
(
	`SEQ`     INT              NOT NULL    AUTO_INCREMENT COMMENT '외국어 시퀀스', 
    `RSMSEQ`  INT              NULL        COMMENT '이력서 시퀀스', 
    `LANG`    VARCHAR(1000)    NULL        COMMENT '언어', 
    `LEVEL`   VARCHAR(1000)    NULL        COMMENT '수준', 
    `TEST`    VARCHAR(1000)    NULL        COMMENT '시험명', 
    `SCORE`   VARCHAR(1000)    NULL        COMMENT '점수/급', 
    `DATE`    VARCHAR(100)     NULL        COMMENT '시험날짜',
    PRIMARY KEY (SEQ)
);

ALTER TABLE LANGUAGE COMMENT '이력서 외국어 테이블';
*/
public class LanguageDto {
	
	int seq; 		// 외국어 시퀀스
	int rsmseq;		// 이력서 시퀀스
	String lang; 	// 언어
	String level;	// 수준
	String test; 	// 시험명
	String score;	// 점수/급
	String date;	// 시험날짜
	
	
	
	public LanguageDto() {

	}
	
	public LanguageDto(int seq, int rsmseq, String lang, String level, String test, String score, String date) {
		super();
		this.seq = seq;
		this.rsmseq = rsmseq;
		this.lang = lang;
		this.level = level;
		this.test = test;
		this.score = score;
		this.date = date;
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
	
	public String getLang() {
		return lang;
	}
	
	public void setLang(String lang) {
		this.lang = lang;
	}
	
	public String getLevel() {
		return level;
	}
	
	public void setLevel(String level) {
		this.level = level;
	}
	
	public String getTest() {
		return test;
	}
	
	public void setTest(String test) {
		this.test = test;
	}
	
	public String getScore() {
		return score;
	}
	
	public void setScore(String score) {
		this.score = score;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "LanguageDto [seq=" + seq + ", rsmseq=" + rsmseq + ", lang=" + lang + ", level=" + level + ", test="
				+ test + ", score=" + score + ", date=" + date + "]";
	}
	
		
	
}
