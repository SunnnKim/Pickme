package model;

public class PremierServiceDto {
	
	private int serviceSeq;			// 시퀀스 PK
	private String serviceName;		// 서비스 명 
	private int price;				// 서비스 가격 
	private int del;				// 삭제여부
	private String content;		// 서비스 내용 
	
	
	public PremierServiceDto() {
		// TODO Auto-generated constructor stub
	}


	public PremierServiceDto(int serviceSeq, String serviceName, int price, int del, String content) {
		super();
		this.serviceSeq = serviceSeq;
		this.serviceName = serviceName;
		this.price = price;
		this.del = del;
		this.content = content;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "PremierServiceDto [serviceSeq=" + serviceSeq + ", serviceName=" + serviceName + ", price=" + price
				+ ", del=" + del + ", content=" + content + "]";
	}

	
	
	
}
