package pickme.com.a.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FilesDto;
import model.NoticeDto;
import model.PremierServiceDto;
import pickme.com.a.customer.dao.CustomerDao;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao dao;

	@Override
	public List<NoticeDto> getAllNoticePage(int pageNumber) {
		return dao.getAllNoticePage(pageNumber);
	}

	@Override
	public NoticeDto getNoticeDetail(int seq) {
		return dao.getNoticeDetail(seq);
	}

	@Override
	public int countAllContent() {
		return dao.countAllContent();
	}

	@Override
	public List<FilesDto> getNoticeFiles(int ref) {
		return dao.getNoticeFiles(ref);
	}

	@Override
	public List<PremierServiceDto> getPremierService() {
		return dao.getPremierService();
	}

	@Override
	public PremierServiceDto getServiceDetail(int serviceSeq) {
		return dao.getServiceDetail(serviceSeq);
	}
	
}
