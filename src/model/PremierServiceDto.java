package model;

public class PremierServiceDto {
	
	private int serviceSeq;			// 시퀀스 PK
	private String serviceName;		// 서비스 명 
	private String price;			// 서비스 가격 
	private String period;			// 서비스 기간
	private String serviceInfo;		// 서비스 내용 요약 
	private String content;			// 서비스 내용 설명 
	private int del;				// 삭제여부
	
	
	public PremierServiceDto() {
		// TODO Auto-generated constructor stub
	}


	public PremierServiceDto(int serviceSeq, String serviceName, String price, String period, String serviceInfo,
			String content, int del) {
		super();
		this.serviceSeq = serviceSeq;
		this.serviceName = serviceName;
		this.price = price;
		this.period = period;
		this.serviceInfo = serviceInfo;
		this.content = content;
		this.del = del;
	}


	public int getServiceSeq() {
		return serviceSeq;
	}


	public void setServiceSeq(int serviceSeq) {
		this.serviceSeq = serviceSeq;
	}


	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getPeriod() {
		return period;
	}


	public void setPeriod(String period) {
		this.period = period;
	}


	public String getServiceInfo() {
		return serviceInfo;
	}


	public void setServiceInfo(String serviceInfo) {
		this.serviceInfo = serviceInfo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "PremierServiceDto [serviceSeq=" + serviceSeq + ", serviceName=" + serviceName + ", price=" + price
				+ ", period=" + period + ", serviceInfo=" + serviceInfo + ", content=" + content + ", del=" + del + "]";
	}
	
	
	
	
}
