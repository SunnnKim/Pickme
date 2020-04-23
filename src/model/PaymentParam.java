package model;

public class PaymentParam {
	
	// 결제 / 유료서비스 관련 파라미터 
	
	// 유료서비스 통계용 
	private int memberCount; 
	private String serviceName;
	
	public PaymentParam() {
		// TODO Auto-generated constructor stub
	}

	public PaymentParam(int memberCount, String serviceName) {
		super();
		this.memberCount = memberCount;
		this.serviceName = serviceName;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	@Override
	public String toString() {
		return "PaymentParam [memberCount=" + memberCount + ", serviceName=" + serviceName + "]";
	}
	
	
	
	
}
