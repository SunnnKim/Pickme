package model;

public class CvCompanyDto {
	
	private int seq;
	private int comseq; // 요청기업시퀀스 
	private String memEmail; // 인재이메일 
	private String userName; // 인재이름 
	private String phone;
	private String name; // 이력서명 
	private String introduce; // 자기소개 
	private String career; // 경력 
	private String education; // 학력 
	private String awardsEtc; // 수상 및 기타 
	private String language; // 외국어 
	private String link;  // 포트폴리오 같은 것 있을때 링크 
	private String wDate; // 작성날짜 
	private String filePath; // 파일경로
	private String fileOriginal; // 원본파일명
	private String fileStored; // 저장파일명 
	private int Status; // 열람 및 삭제(0:미열람, 1:열람, 2:삭제)
	
	public CvCompanyDto(){
		
	}

	public CvCompanyDto(int seq, int comseq, String memEmail, String userName, String phone, String name,
			String introduce, String career, String education, String awardsEtc, String language, String link,
			String wDate, String filePath, String fileOriginal, String fileStored, int status) {
		super();
		this.seq = seq;
		this.comseq = comseq;
		this.memEmail = memEmail;
		this.userName = userName;
		this.phone = phone;
		this.name = name;
		this.introduce = introduce;
		this.career = career;
		this.education = education;
		this.awardsEtc = awardsEtc;
		this.language = language;
		this.link = link;
		this.wDate = wDate;
		this.filePath = filePath;
		this.fileOriginal = fileOriginal;
		this.fileStored = fileStored;
		Status = status;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getComseq() {
		return comseq;
	}

	public void setComseq(int comseq) {
		this.comseq = comseq;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAwardsEtc() {
		return awardsEtc;
	}

	public void setAwardsEtc(String awardsEtc) {
		this.awardsEtc = awardsEtc;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileOriginal() {
		return fileOriginal;
	}

	public void setFileOriginal(String fileOriginal) {
		this.fileOriginal = fileOriginal;
	}

	public String getFileStored() {
		return fileStored;
	}

	public void setFileStored(String fileStored) {
		this.fileStored = fileStored;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "CvCompanyDto [seq=" + seq + ", comseq=" + comseq + ", memEmail=" + memEmail + ", userName=" + userName
				+ ", phone=" + phone + ", name=" + name + ", introduce=" + introduce + ", career=" + career
				+ ", education=" + education + ", awardsEtc=" + awardsEtc + ", language=" + language + ", link=" + link
				+ ", wDate=" + wDate + ", filePath=" + filePath + ", fileOriginal=" + fileOriginal + ", fileStored="
				+ fileStored + ", Status=" + Status + "]";
	}
	
	

}
