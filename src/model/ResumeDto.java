package model;

public class ResumeDto {
	
	private int seq;			// 시퀀스 (pk) 
	private int memSeq;			// 이력서 저장한 일반회원 시퀀스
	private String name;		// 이력서 제목 
	private String userName;	// 이력서 작성 회원이름 
	
	private String introduce;	// 내용 : 소개 
	private String career;		// 내용 : 경력사항  
	private String education;	// 내용 : 학력  
	private String awardsEtc;	// 내용 : 수상 및 기타 
	private String language;	// 내용 : 언어
	private String link;		// 내용 : 링크된 주소 
	
	private String wDate;		// 작성일 
	private int status;			// 작성상태 ( 0: 작성중, 1:작성완료 ) 
	
	private String filePath;	// 이력서 파일로 저장할 때 : 경로 
	private String fileOriginal; // 이력서 파일로 저장할 때 : 파일원본이름 
	private String fileStored;	 // 이력서 파일로 저장할 때 : 저장한 이름 
	
	private int mainResume;		 // 대표이력서일때 = 1 
	private String phone;		 // 대표연락처 
	private String memEmail;	 // 회원이메일 
	private int del;			 // 삭제여부 
	
	public ResumeDto() {
		// TODO Auto-generated constructor stub
	}

	public ResumeDto(int seq, int memSeq, String name, String userName, String introduce, String career,
			String education, String awardsEtc, String language, String link, String wDate, int status, String filePath,
			String fileOriginal, String fileStored, int mainResume, String phone, String memEmail, int del) {
		super();
		this.seq = seq;
		this.memSeq = memSeq;
		this.name = name;
		this.userName = userName;
		this.introduce = introduce;
		this.career = career;
		this.education = education;
		this.awardsEtc = awardsEtc;
		this.language = language;
		this.link = link;
		this.wDate = wDate;
		this.status = status;
		this.filePath = filePath;
		this.fileOriginal = fileOriginal;
		this.fileStored = fileStored;
		this.mainResume = mainResume;
		this.phone = phone;
		this.memEmail = memEmail;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public int getMainResume() {
		return mainResume;
	}

	public void setMainResume(int mainResume) {
		this.mainResume = mainResume;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ResumeDto [seq=" + seq + ", memSeq=" + memSeq + ", name=" + name + ", userName=" + userName
				+ ", introduce=" + introduce + ", career=" + career + ", education=" + education + ", awardsEtc="
				+ awardsEtc + ", language=" + language + ", link=" + link + ", wDate=" + wDate + ", status=" + status
				+ ", filePath=" + filePath + ", fileOriginal=" + fileOriginal + ", fileStored=" + fileStored
				+ ", mainResume=" + mainResume + ", phone=" + phone + ", memEmail=" + memEmail + ", del=" + del + "]";
	}
	
	

	
	
}
