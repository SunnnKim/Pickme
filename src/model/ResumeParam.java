package model;

public class ResumeParam {
	
	// paging
	private int pageNumber = 0;			//현재페이지
	private int recordCountPerPage = 10;	//한 페이지당 게시글 수		
			
	// DB
	private int start=1; 
	private int end=10;
		
	// user seq
	private int memSeq;
	
	
	
	public ResumeParam() {	
	}	
	

	public ResumeParam(int pageNumber, int recordCountPerPage, int start, int end, int memSeq) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
		this.memSeq = memSeq;
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

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	

	@Override
	public String toString() {
		return "ResumeParam [pageNumber=" + pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", start="
				+ start + ", end=" + end + ", memSeq=" + memSeq + "]";
	}
	
		
		
}
