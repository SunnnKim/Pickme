package pickme.com.a.customer.service;

import java.util.List;

import model.NoticeDto;

public interface CustomerService {

	public List<NoticeDto> getAllNoticePage(int pageNumber);
	public NoticeDto getNoticeDetail(int seq);
	public int countAllContent();
}
