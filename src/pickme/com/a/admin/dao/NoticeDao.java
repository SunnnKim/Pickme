package pickme.com.a.admin.dao;

import java.util.List;

import model.FilesDto;
import model.NoticeDto;

public interface NoticeDao {
	
	public int insertNotice(NoticeDto dto);
	public boolean insertFiles(List<FilesDto> list);
	public List<NoticeDto> getAllNotice();
	
}
