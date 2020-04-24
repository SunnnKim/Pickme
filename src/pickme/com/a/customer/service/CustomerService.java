package pickme.com.a.customer.service;

import java.util.List;

import model.FilesDto;
import model.NoticeDto;
import model.PremierServiceDto;

public interface CustomerService {

	public List<NoticeDto> getAllNoticePage(int pageNumber);
	public NoticeDto getNoticeDetail(int seq);
	public int countAllContent();
	// 공지사항 디테일 파일들 가져오기
	public List<FilesDto> getNoticeFiles(int ref);
	// 유료서비스 
	public List<PremierServiceDto> getPremierService();
	public PremierServiceDto getServiceDetail(int serviceSeq);
}
