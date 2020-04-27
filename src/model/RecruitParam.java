package model;

public class RecruitParam {
	//paging
	private int pageNumber=0;			//현재페이지
	private int recordCountPerPage=8;	//한 페이지당 게시글 수
	
	// search 
	private String sKeyword;
	
	// 직군 , 직무, 필터
	private String occ;
	private String job;
	private String sorting;
	private String career;
	
	//DB에서 사용할 변수
	private int start = 1;				
	private int end = 10;
	
	//com seq
	private int comSeq;
	
	public RecruitParam() {	
	}
	

	public RecruitParam(int pageNumber, int recordCountPerPage, String sKeyword, String occ, String job, String sorting,
			String career, int start, int end, int comSeq) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.sKeyword = sKeyword;
		this.occ = occ;
		this.job = job;
		this.sorting = sorting;
		this.career = career;
		this.start = start;
		this.end = end;
		this.comSeq = comSeq;
	}


	public String getOcc() {
		return occ;
	}


	public void setOcc(String occ) {
		this.occ = occ;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getSorting() {
		return sorting;
	}


	public void setSorting(String sorting) {
		this.sorting = sorting;
	}


	public String getCareer() {
		return career;
	}


	public void setCareer(String career) {
		this.career = career;
	}


	public int getComSeq() {
		return comSeq;
	}

	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}

	

	public String getsKeyword() {
		return sKeyword;
	}


	public void setsKeyword(String sKeyword) {
		this.sKeyword = sKeyword;
	}


	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}


	@Override
	public String toString() {
		return "RecruitParam [pageNumber=" + pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", sKeyword="
				+ sKeyword + ", start=" + start + ", end=" + end + ", comSeq=" + comSeq + "]";
	}
	
	
	
}
