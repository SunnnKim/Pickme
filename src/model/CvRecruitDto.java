package model;

public class CvRecruitDto {
	
	private int seq;			// 시퀀스 (pk) 
	private int recruitSeq;		// 지원한 공고 시퀀스
	private String memEmail;	// 회원이메일 
	private String userName;	// 인재이름 
	private String phone;		// 인재이름 
	private String name;		// 이력서 제목 
	private String introduce;	// 내용 : 소개 
	private String career;		// 내용 : 경력사항  
	private String education;	// 내용 : 학력  
	private String awardsEtc;	// 내용 : 수상 및 기타 
	private String language;	// 내용 : 언어
	private String link;		// 내용 : 링크된 주소 
	private String wDate;		// 작성일 
	private String filePath;	// 이력서 파일로 저장할 때 : 경로 
	private String fileOriginal; // 이력서 파일로 저장할 때 : 파일원본이름 
	private String fileStored;	 // 이력서 파일로 저장할 때 : 저장한 이름 
	//private int status;		// 열람 및 삭제여부 

	
	public CvRecruitDto() {
		// TODO Auto-generated constructor stub
	}

	public CvRecruitDto(int seq, int recruitSeq, String memEmail, String userName, String phone, String name,
			String introduce, String career, String education, String awardsEtc, String language, String link,
			String wDate, String filePath, String fileOriginal, String fileStored) {
		super();
		this.seq = seq;
		this.recruitSeq = recruitSeq;
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
	}




	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getRecruitSeq() {
		return recruitSeq;
	}


	public void setRecruitSeq(int recruitSeq) {
		this.recruitSeq = recruitSeq;
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




	@Override
	public String toString() {
		return "CvRecruitDto [seq=" + seq + ", recruitSeq=" + recruitSeq + ", memEmail=" + memEmail + ", userName="
				+ userName + ", phone=" + phone + ", name=" + name + ", introduce=" + introduce + ", career=" + career
				+ ", education=" + education + ", awardsEtc=" + awardsEtc + ", language=" + language + ", link=" + link
				+ ", wDate=" + wDate + ", filePath=" + filePath + ", fileOriginal=" + fileOriginal + ", fileStored="
				+ fileStored + "]";
	}

	
}
