package model;

public class CMemberMypageDto {
	
	
	// 기업 회원 정보 수정
	private int cMemberSeq;				// 기업 시퀀스
	private String email;				// 이메일 (아이디)
	private String pwd;					// 비밀번호
	private String president;			// 대표자 성명
	private String c_name;				// 기업명
	private String tel;					// 전화번호
	private String c_department;		// 기업 업종
	private String c_type;				// 기업 종류 (대기업/중소/중견 등)
	private String c_address;			// 기업 주소
	private String c_introduce;			// 기업 소개
	private int secession;				// 탈퇴 여부
	private String hashTag;				// 해시태그
	private int number;					// 사업자등록번호
	private String logo_path;			// 로고이미지 경로
	private String logo_name;			// 로고이미지 이름
	
	
	// 결제
	private int paySeq;				// 결제 시퀀스
	private int buyer_id;			// 결제자 아이디 시퀀스
	private String service_name;	// 서비스명
	private String payDate;			// 결제일
	private int totalPay;			// 총 결제금액
	private int refund;				// 환불여부
	private String request_date;	// 환불요청일
	private String refund_date;		// 환불처리일
	
	
	public CMemberMypageDto() {
		// TODO Auto-generated constructor stub
	}


	public CMemberMypageDto(int cMemberSeq, String email, String pwd, String president, String c_name, String tel,
			String c_department, String c_type, String c_address, String c_introduce, int secession, String hashTag,
			int number, String logo_path, String logo_name, int paySeq, int buyer_id, String service_name,
			String payDate, int totalPay, int refund, String request_date, String refund_date) {
		super();
		this.cMemberSeq = cMemberSeq;
		this.email = email;
		this.pwd = pwd;
		this.president = president;
		this.c_name = c_name;
		this.tel = tel;
		this.c_department = c_department;
		this.c_type = c_type;
		this.c_address = c_address;
		this.c_introduce = c_introduce;
		this.secession = secession;
		this.hashTag = hashTag;
		this.number = number;
		this.logo_path = logo_path;
		this.logo_name = logo_name;
		this.paySeq = paySeq;
		this.buyer_id = buyer_id;
		this.service_name = service_name;
		this.payDate = payDate;
		this.totalPay = totalPay;
		this.refund = refund;
		this.request_date = request_date;
		this.refund_date = refund_date;
	}


	public CMemberMypageDto(int cMemberSeq, String email, String pwd, String president, String c_name, String tel,
			String c_department, String c_type, String c_address, String c_introduce, int secession, String hashTag,
			int number, String logo_path, String logo_name) {
		super();
		this.cMemberSeq = cMemberSeq;
		this.email = email;
		this.pwd = pwd;
		this.president = president;
		this.c_name = c_name;
		this.tel = tel;
		this.c_department = c_department;
		this.c_type = c_type;
		this.c_address = c_address;
		this.c_introduce = c_introduce;
		this.secession = secession;
		this.hashTag = hashTag;
		this.number = number;
		this.logo_path = logo_path;
		this.logo_name = logo_name;
	}


	public CMemberMypageDto(int paySeq, int buyer_id, String service_name, String payDate, int totalPay, int refund,
			String request_date, String refund_date) {
		super();
		this.paySeq = paySeq;
		this.buyer_id = buyer_id;
		this.service_name = service_name;
		this.payDate = payDate;
		this.totalPay = totalPay;
		this.refund = refund;
		this.request_date = request_date;
		this.refund_date = refund_date;
	}


	public int getcMemberSeq() {
		return cMemberSeq;
	}


	public void setcMemberSeq(int cMemberSeq) {
		this.cMemberSeq = cMemberSeq;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getPresident() {
		return president;
	}


	public void setPresident(String president) {
		this.president = president;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getC_department() {
		return c_department;
	}


	public void setC_department(String c_department) {
		this.c_department = c_department;
	}


	public String getC_type() {
		return c_type;
	}


	public void setC_type(String c_type) {
		this.c_type = c_type;
	}


	public String getC_address() {
		return c_address;
	}


	public void setC_address(String c_address) {
		this.c_address = c_address;
	}


	public String getC_introduce() {
		return c_introduce;
	}


	public void setC_introduce(String c_introduce) {
		this.c_introduce = c_introduce;
	}


	public int getSecession() {
		return secession;
	}


	public void setSecession(int secession) {
		this.secession = secession;
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


	public String getLogo_path() {
		return logo_path;
	}


	public void setLogo_path(String logo_path) {
		this.logo_path = logo_path;
	}


	public String getLogo_name() {
		return logo_name;
	}


	public void setLogo_name(String logo_name) {
		this.logo_name = logo_name;
	}


	public int getPaySeq() {
		return paySeq;
	}


	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}


	public int getBuyer_id() {
		return buyer_id;
	}


	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}


	public String getService_name() {
		return service_name;
	}


	public void setService_name(String service_name) {
		this.service_name = service_name;
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


	public String getRequest_date() {
		return request_date;
	}


	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}


	public String getRefund_date() {
		return refund_date;
	}


	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}


	@Override
	public String toString() {
		return "CMemberMypageDto [cMemberSeq=" + cMemberSeq + ", email=" + email + ", pwd=" + pwd + ", president="
				+ president + ", c_name=" + c_name + ", tel=" + tel + ", c_department=" + c_department + ", c_type="
				+ c_type + ", c_address=" + c_address + ", c_introduce=" + c_introduce + ", secession=" + secession
				+ ", hashTag=" + hashTag + ", number=" + number + ", logo_path=" + logo_path + ", logo_name="
				+ logo_name + ", paySeq=" + paySeq + ", buyer_id=" + buyer_id + ", service_name=" + service_name
				+ ", payDate=" + payDate + ", totalPay=" + totalPay + ", refund=" + refund + ", request_date="
				+ request_date + ", refund_date=" + refund_date + "]";
	}
	
	
}






