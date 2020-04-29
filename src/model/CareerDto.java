package model;
/*
	CREATE TABLE CAREER
	(
	    `RSMSEQ`     INT              NULL        COMMENT '이력서 시퀀스', 
	    `COMPANY`    VARCHAR(2000)    NULL        COMMENT '회사명', 
	    `POSITION`   VARCHAR(2000)    NULL        COMMENT '부서명/직책', 
	    `STARTDATE`  VARCHAR(100)     NULL        COMMENT '입사 날짜', 
	    `ENDDATE`    VARCHAR(100)     NULL        COMMENT '퇴사 날짜', 
	    `ING`        VARCHAR(200)      NULL        COMMENT '현재 재직중 (0 재직중, 1 퇴사)'
	);
	
	ALTER TABLE CAREER COMMENT '이력서 경력 테이블';
*/
public class CareerDto { // 이력서 경력 테이블
	
	int rsmseq; 	    // 이력서 시퀀스
    String company;	    // 회사명
    String position;	// 부서명/직책
    String startdate;	// 입사 날짜
    String enddate;		// 퇴사 날짜
    String ing;			// 현재 재직중 (0 퇴사, 1 재직중)
    
    
    public CareerDto() {
	
	}       
    
	public CareerDto(int rsmseq, String company, String position, String startdate, String enddate, String ing) {
		super();
		this.rsmseq = rsmseq;
		this.company = company;
		this.position = position;
		this.startdate = startdate;
		this.enddate = enddate;
		this.ing = ing;
	}

	public int getRsmseq() {
		return rsmseq;
	}
	
	public void setRsmseq(int rsmseq) {
		this.rsmseq = rsmseq;
	}
	
	public String getCompany() {
		return company;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
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
		return "Career [rsmseq=" + rsmseq + ", company=" + company + ", position=" + position + ", startdate="
				+ startdate + ", enddate=" + enddate + ", ing=" + ing + "]";
	}
    
    
    
    
    

}
