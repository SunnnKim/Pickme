package pickme.com.a.recruit.dao;

import java.util.List;

import model.FilesDto;
import model.RecruitDto;

public interface RecruitDao {

	public int getRef();
	public int getLastSeq();
	public int insertRecruit(RecruitDto dto);
	public boolean insertRecFile(List<FilesDto> list);
}
