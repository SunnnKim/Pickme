package model;

public class RecruitParam {
	//paging
	private int pageNumber=0;			//현재페이지
	private int recordCountPerPage=12;	//한 페이지당 게시글 수
	
	//DB에서 사용할 변수
	private int start = 1;				
	private int end = 12;
	
	public RecruitParam() {	
	}

	public RecruitParam(int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
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
	
	
	
}
