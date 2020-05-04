package model;

public class PremierMemDto {

	private int seq;
	private int userSeq;
	private int serviceSeq;
	private String name;	// 데이터베이스 테이블 컬럼에는 없음(출력용)  
	private String serviceName;
	private String startDate;
	private String endDate;
	private String impUid;
	private int del;
	
	
	public PremierMemDto() {
		// TODO Auto-generated constructor stub
	}


	public PremierMemDto(int seq, int userSeq, int serviceSeq, String name, String serviceName, String startDate,
			String endDate, String impUid, int del) {
		super();
		this.seq = seq;
		this.userSeq = userSeq;
		this.serviceSeq = serviceSeq;
		this.name = name;
		this.serviceName = serviceName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.impUid = impUid;
		this.del = del;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getUserSeq() {
		return userSeq;
	}


	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}


	public int getServiceSeq() {
		return serviceSeq;
	}


	public void setServiceSeq(int serviceSeq) {
		this.serviceSeq = serviceSeq;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getImpUid() {
		return impUid;
	}


	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "PremierMemDto [seq=" + seq + ", userSeq=" + userSeq + ", serviceSeq=" + serviceSeq + ", name=" + name
				+ ", serviceName=" + serviceName + ", startDate=" + startDate + ", endDate=" + endDate + ", impUid="
				+ impUid + ", del=" + del + "]";
	}

	

	
	
}
