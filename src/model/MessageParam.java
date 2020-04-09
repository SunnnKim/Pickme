package model;

import java.io.Serializable;

public class MessageParam implements Serializable{
	
	// login id
	private int toSeq;
	
	// search 
	private String sKeyword;
	
	// paging
	private int pageNumber = 0;
	private int recordCountPerPage = 10;
	
	
	// DB
	private int start = 0;
	private int end = 10;
	
	
	public MessageParam() {
		
	}


	public MessageParam(int toSeq, String sKeyword, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.toSeq = toSeq;
		this.sKeyword = sKeyword;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}


	public int getToSeq() {
		return toSeq;
	}


	public void setToSeq(int toSeq) {
		this.toSeq = toSeq;
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
		return "MessageParam [toSeq=" + toSeq + ", sKeyword=" + sKeyword + ", pageNumber=" + pageNumber
				+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
}