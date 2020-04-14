package pickme.com.a.customer.dao;

import java.util.List;

import model.NoticeDto;

public interface CustomerDao {
	
	// 공지사항 리스트 + 페이징 
	public List<NoticeDto> getAllNoticePage(int pageNumber);
	// 페이징 : 전체 글의개수 구하기 
	public int countAllContent();
	// 공지사항 디테일 페이지 만들기 
	public NoticeDto getNoticeDetail(int seq);
	
}
