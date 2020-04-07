package model;

public class CMemberMypageDto {
	
	
	// 기업 회원 정보 수정
	private int memberSeq;			// 기업시퀀스
	private String email;			// 이메일
	private String password;		// 비밀번호
	private String president;		// 대표자 성명
	private String name;			// 기업명
	private String tel;				// 전화번호
	private String department;		// 기업분야
	private String type;			// 기업종류
	private String address;			// 주소
	private String introduce;		// 기업소개
	private int del;				// 탈퇴여부 (0 등록 / 1 삭제)
	private String hashTag;			// 해시태그
	private int number;				// 사업자등록번호
	private String logoPath;		// 로고이미지 경로
	private String logoName;		// 로고이미지 이름
	
	// 결제
	private int paySeq;				// 결제시퀀스
	private int buyerId;			// 결제자 아이디 시퀀스
	private String serviceName;		// 결제 서비스명
	private String payDate;			// 결제일
	private int totalPay;			// 총 결제금액
	private int refund;				// 환불여부
	private String requestDate;		// 환불요청일
	private String refundDate;		// 환불처리일
	
	
	public CMemberMypageDto() {
		// TODO Auto-generated constructor stub
	}


	public CMemberMypageDto(int memberSeq, String email, String password, String president, String name, String tel,
			String department, String type, String address, String introduce, int del, String hashTag, int number,
			String logoPath, String logoName, int paySeq, int buyerId, String serviceName, String payDate, int totalPay,
			int refund, String requestDate, String refundDate) {
		super();
		this.memberSeq = memberSeq;
		this.email = email;
		this.password = password;
		this.president = president;
		this.name = name;
		this.tel = tel;
		this.department = department;
		this.type = type;
		this.address = address;
		this.introduce = introduce;
		this.del = del;
		this.hashTag = hashTag;
		this.number = number;
		this.logoPath = logoPath;
		this.logoName = logoName;
		this.paySeq = paySeq;
		this.buyerId = buyerId;
		this.serviceName = serviceName;
		this.payDate = payDate;
		this.totalPay = totalPay;
		this.refund = refund;
		this.requestDate = requestDate;
		this.refundDate = refundDate;
	}


	public CMemberMypageDto(int memberSeq, String email, String password, String president, String name, String tel,
			String department, String type, String address, String introduce, int del, String hashTag, int number,
			String logoPath, String logoName) {
		super();
		this.memberSeq = memberSeq;
		this.email = email;
		this.password = password;
		this.president = president;
		this.name = name;
		this.tel = tel;
		this.department = department;
		this.type = type;
		this.address = address;
		this.introduce = introduce;
		this.del = del;
		this.hashTag = hashTag;
		this.number = number;
		this.logoPath = logoPath;
		this.logoName = logoName;
	}


	public CMemberMypageDto(int paySeq, int buyerId, String serviceName, String payDate, int totalPay, int refund,
			String requestDate, String refundDate) {
		super();
		this.paySeq = paySeq;
		this.buyerId = buyerId;
		this.serviceName = serviceName;
		this.payDate = payDate;
		this.totalPay = totalPay;
		this.refund = refund;
		this.requestDate = requestDate;
		this.refundDate = refundDate;
	}

	
	
	
	
	

	public int getMemberSeq() {
		return memberSeq;
	}


	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPresident() {
		return president;
	}


	public void setPresident(String president) {
		this.president = president;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	public String getHashTag() {
		return hashTag;
	}


	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}


	public int getNumber() {
		return number;
	}


	public void setNumber(int number) {
		this.number = number;
	}


	public String getLogoPath() {
		return logoPath;
	}


	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}


	public String getLogoName() {
		return logoName;
	}


	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}


	public int getPaySeq() {
		return paySeq;
	}


	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
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


	@Override
	public String toString() {
		return "CMemberMypageDto [memberSeq=" + memberSeq + ", email=" + email + ", password=" + password
				+ ", president=" + president + ", name=" + name + ", tel=" + tel + ", department=" + department
				+ ", type=" + type + ", address=" + address + ", introduce=" + introduce + ", del=" + del + ", hashTag="
				+ hashTag + ", number=" + number + ", logoPath=" + logoPath + ", logoName=" + logoName + ", paySeq="
				+ paySeq + ", buyerId=" + buyerId + ", serviceName=" + serviceName + ", payDate=" + payDate
				+ ", totalPay=" + totalPay + ", refund=" + refund + ", requestDate=" + requestDate + ", refundDate="
				+ refundDate + "]";
	}

	
	

	
	
}






