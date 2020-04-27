package model;

public class EInterestParam {
	private String email;
	
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
		private String filter = "채용마감일";
		
		
		public EInterestParam() {
			
		}


		public EInterestParam(String email, String sKeyword, int pageNumber, int recordCountPerPage, int start, int end,
				int sort, String filter) {
			super();
			this.email = email;
			this.sKeyword = sKeyword;
			this.pageNumber = pageNumber;
			this.recordCountPerPage = recordCountPerPage;
			this.start = start;
			this.end = end;
			this.sort = sort;
			this.filter = filter;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
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


		@Override
		public String toString() {
			return "EInterestParam [email=" + email + ", sKeyword=" + sKeyword + ", pageNumber=" + pageNumber
					+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + ", sort="
					+ sort + ", filter=" + filter + "]";
		}
		
	
	

}
