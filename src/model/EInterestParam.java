package model;

public class EInterestParam {
	    private String email; // 로그인 유저 이메일 
	    private int memseq;// 로그인 유저 시퀀스
	    private int likepickseq; // 좋아요 한 기업 or 채용공고 시퀀스 
		// 채용공고 seq
		private int jobseq;
		
		// search 
		private String sKeyword;
			
		// paging
		private int pageNumber = 0;
		private int recordCountPerPage = 10;
			
			
		// DB
		private int start = 0;
		private int end = 10;
			
		// sort ( 0: 내림, 1: 오름)
		private int sort = 0; 
		private String filter = "공고등록일";
		
		private int auth; // 관심기업: 1 or 관심채용: 3 
		
		public EInterestParam() {
			
		}

		public EInterestParam(String email, int memseq, int likepickseq, int jobseq, String sKeyword, int pageNumber,
				int recordCountPerPage, int start, int end, int sort, String filter, int auth) {
			super();
			this.email = email;
			this.memseq = memseq;
			this.likepickseq = likepickseq;
			this.jobseq = jobseq;
			this.sKeyword = sKeyword;
			this.pageNumber = pageNumber;
			this.recordCountPerPage = recordCountPerPage;
			this.start = start;
			this.end = end;
			this.sort = sort;
			this.filter = filter;
			this.auth = auth;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public int getMemseq() {
			return memseq;
		}

		public void setMemseq(int memseq) {
			this.memseq = memseq;
		}

		public int getLikepickseq() {
			return likepickseq;
		}

		public void setLikepickseq(int likepickseq) {
			this.likepickseq = likepickseq;
		}

		public int getJobseq() {
			return jobseq;
		}

		public void setJobseq(int jobseq) {
			this.jobseq = jobseq;
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

		public int getSort() {
			return sort;
		}

		public void setSort(int sort) {
			this.sort = sort;
		}

		public String getFilter() {
			return filter;
		}

		public void setFilter(String filter) {
			this.filter = filter;
		}

		public int getAuth() {
			return auth;
		}

		public void setAuth(int auth) {
			this.auth = auth;
		}

	

}
