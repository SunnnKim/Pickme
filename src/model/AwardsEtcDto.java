package model;
/*

CREATE TABLE AWARDSETC
(
	`SEQ`     INT              NOT NULL    AUTO_INCREMENT COMMENT '수상 및 기타 시퀀스', 
    `RSMSEQ`  INT              NULL        COMMENT '이력서 시퀀스', 
    `AWARDS`  VARCHAR(2000)    NULL        COMMENT '활동명', 
    `DETAIL`  VARCHAR(3000)    NULL        COMMENT '세부사항', 
    `DATE`    VARCHAR(100)     NULL        COMMENT '수상날짜',
    PRIMARY KEY (SEQ)
);

ALTER TABLE AWARDSETC COMMENT '이력서 수상 및 기타 테이블';

*/
public class AwardsEtcDto {
	
	int seq;			// 수상 및 기타 시퀀스
	int rsmseq;			// 이력서 시퀀스
	String awards;		// 활동명
	String detail;		// 세부사항
	String date;		// 수상날짜
	
	
	public AwardsEtcDto() {
		
	}	
	
	public AwardsEtcDto(int seq, int rsmseq, String awards, String detail, String date) {
		super();
		this.seq = seq;
		this.rsmseq = rsmseq;
		this.awards = awards;
		this.detail = detail;
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
	
	public String getAwards() {
		return awards;
	}
	
	public void setAwards(String awards) {
		this.awards = awards;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "AwardsEtcDto [seq=" + seq + ", rsmseq=" + rsmseq + ", awards=" + awards + ", detail=" + detail
				+ ", date=" + date + "]";
	}

	
	
	
}
