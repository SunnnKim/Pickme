package pickme.com.a.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.FilesDto;
import model.NoticeDto;
import pickme.com.a.admin.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;

	@Override
	public int insertNotice(NoticeDto dto) {
		return dao.insertNotice(dto);
	}

	@Override
	public boolean insertFiles(List<FilesDto> list) {
		return dao.insertFiles(list);
	}

	@Override
	public List<NoticeDto> getAllNotice() {
		return dao.getAllNotice();
	}

	@Override
	public NoticeDto getNoticeDetail(int seq) {
		return dao.getNoticeDetail(seq);
	}

	@Override
	public List<FilesDto> getNoticeFiles(int ref) {
		return dao.getNoticeFiles(ref);
	}

	@Override
	public boolean updateNotice(NoticeDto notice) {
		return dao.updateNotice(notice);
	}

	@Override
	public void deleteNoticeFiles(int ref) {
		dao.deleteNoticeFiles(ref);
	}

	@Override
	public boolean deleteNotice(List<Integer> seqList) {
		return dao.deleteNotice(seqList);
	}
	
	
}
