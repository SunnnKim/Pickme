package model;

public class PaymentDto {

      // 결제
      private int seq;            	// 결제시퀀스
      private int buyerId;         	// 결제자 아이디 시퀀스
      private String serviceName;   // 결제 서비스명 (주문명) - 아임포트(name)
      private String payDate;       // 결제일
      private int totalPay;         // 결제 금액(환불 가능 금액 계산시 사용) - 아임포트(amount)
      private int refund;           // 환불여부
      private String requestDate;   // 환불요청일
      private String refundDate;    // 환불처리일
      private String refundInfo;    // 환불 이유 
      private String method;        // 결제방법 
      private String paymentId;     // 주문번호(결제정보 조회시 사용)   - 아임포트 (merchant_uid)
      private String impUid;        // 아임포트 고유id 결제성공시 리턴 , 환불시에도 사용  - 아임포트 (imp_uid)
      private String endDate;		// 서비스종료일
      
      // 데이터베이스에서 조인용 변수
      private String buyerName;
      
      
      public PaymentDto() {
         // TODO Auto-generated constructor stub
      }


	public PaymentDto(int seq, int buyerId, String serviceName, String payDate, int totalPay, int refund,
			String requestDate, String refundDate, String refundInfo, String method, String paymentId, String impUid,
			String endDate, String buyerName) {
		super();
		this.seq = seq;
		this.buyerId = buyerId;
		this.serviceName = serviceName;
		this.payDate = payDate;
		this.totalPay = totalPay;
		this.refund = refund;
		this.requestDate = requestDate;
		this.refundDate = refundDate;
		this.refundInfo = refundInfo;
		this.method = method;
		this.paymentId = paymentId;
		this.impUid = impUid;
		this.endDate = endDate;
		this.buyerName = buyerName;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getBuyerId() {
		return buyerId;
	}


	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}


	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}


	public int getTotalPay() {
		return totalPay;
	}


	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}


	public int getRefund() {
		return refund;
	}


	public void setRefund(int refund) {
		this.refund = refund;
	}


	public String getRequestDate() {
		return requestDate;
	}


	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}


	public String getRefundDate() {
		return refundDate;
	}


	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}


	public String getRefundInfo() {
		return refundInfo;
	}


	public void setRefundInfo(String refundInfo) {
		this.refundInfo = refundInfo;
	}


	public String getMethod() {
		return method;
	}


	public void setMethod(String method) {
		this.method = method;
	}


	public String getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}


	public String getImpUid() {
		return impUid;
	}


	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getBuyerName() {
		return buyerName;
	}


	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}


	@Override
	public String toString() {
		return "PaymentDto [seq=" + seq + ", buyerId=" + buyerId + ", serviceName=" + serviceName + ", payDate="
				+ payDate + ", totalPay=" + totalPay + ", refund=" + refund + ", requestDate=" + requestDate
				+ ", refundDate=" + refundDate + ", refundInfo=" + refundInfo + ", method=" + method + ", paymentId="
				+ paymentId + ", impUid=" + impUid + ", endDate=" + endDate + ", buyerName=" + buyerName + "]";
	}


      


	
      
}