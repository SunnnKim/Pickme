package pickme.com.a.customer.dao;

import java.util.List;

import model.FilesDto;
import model.NoticeDto;
import model.PremierServiceDto;

public interface CustomerDao {
	
	// @@@@@ 공지사항 @@@@@
	// 공지사항 리스트 + 페이징 
	public List<NoticeDto> getAllNoticePage(int pageNumber);
	// 페이징 : 전체 글의개수 구하기 
	public int countAllContent();
	// 공지사항 디테일 페이지 만들기 
	public NoticeDto getNoticeDetail(int seq);
	// 공지사항 디테일 파일들 가져오기
	public List<FilesDto> getNoticeFiles(int ref);
	
	// @@@@@ 유료서비스 @@@@@
	// 모든 유료서비스 불러오기 
	public List<PremierServiceDto> getPremierService();
	// 유료 서비스 디테일보기
	public PremierServiceDto getServiceDetail(int serviceSeq);
	
}
