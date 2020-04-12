package pickme.com.a.admin.service;

import java.util.List;

import model.FilesDto;
import model.NoticeDto;

public interface NoticeService {

	public int insertNotice(NoticeDto dto);
	public boolean insertFiles(List<FilesDto> list);
	public List<NoticeDto> getAllNotice();
}
