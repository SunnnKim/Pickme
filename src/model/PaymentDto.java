package model;

public class PaymentDto {

		// 결제
		private int seq;				// 결제시퀀스
		private int buyerId;			// 결제자 아이디 시퀀스
		private String serviceName;		// 결제 서비스명
		private String payDate;			// 결제일
		private int totalPay;			// 총 결제금액
		private int refund;				// 환불여부
		private String requestDate;		// 환불요청일
		private String refundDate;		// 환불처리일
		private String method;			// 결제방법 
		private int pay;				// 결제여부 
		 
		public PaymentDto() {
			// TODO Auto-generated constructor stub
		}

		public PaymentDto(int seq, int buyerId, String serviceName, String payDate, int totalPay, int refund,
				String requestDate, String refundDate, String method, int pay) {
			super();
			this.seq = seq;
			this.buyerId = buyerId;
			this.serviceName = serviceName;
			this.payDate = payDate;
			this.totalPay = totalPay;
			this.refund = refund;
			this.requestDate = requestDate;
			this.refundDate = refundDate;
			this.method = method;
			this.pay = pay;
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

		public String getMethod() {
			return method;
		}

		public void setMethod(String method) {
			this.method = method;
		}

		public int getPay() {
			return pay;
		}

		public void setPay(int pay) {
			this.pay = pay;
		}

		@Override
		public String toString() {
			return "PaymentDto [seq=" + seq + ", buyerId=" + buyerId + ", serviceName=" + serviceName + ", payDate="
					+ payDate + ", totalPay=" + totalPay + ", refund=" + refund + ", requestDate=" + requestDate
					+ ", refundDate=" + refundDate + ", method=" + method + ", pay=" + pay + "]";
		}
		
		
	
}
