package model;

public class CvReqParam {
	
	private int loginSeq;	 // 로그인 시퀀스
	
	// search 
	private String sKeyword; // 검색어
	
	// paging
	private int pageNumber = 0;   		 // 넘어갈 페이지 넘버
	private int recordCountPerPage = 10; // 한페이지에 보여줄 글의 개수
	
	
	// DB
	private int start = 0;   // 페이지에 뿌려줄 첫번째 글의 넘버(RNum order했을때 순서) 
	private int end = 10;    // 페이지에 뿌려줄 마지막 글의 넘버


	public CvReqParam() {
		
	}


	public CvReqParam(int loginSeq, String sKeyword, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.loginSeq = loginSeq;
		this.sKeyword = sKeyword;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}


	public int getLoginSeq() {
		return loginSeq;
	}


	public void setLoginSeq(int loginSeq) {
		this.loginSeq = loginSeq;
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
		return "CvReqParam [loginSeq=" + loginSeq + ", sKeyword=" + sKeyword + ", pageNumber=" + pageNumber
				+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
	

}
