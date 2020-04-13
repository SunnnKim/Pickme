package pickme.com.a.recruit.service;

import java.util.List;

import model.FilesDto;
import model.RecruitDto;

public interface RecruitService {
	public int getRef();
	public int getLastSeq();
	public int insertRecruit(RecruitDto dto);
	public boolean insertRecFile(List<FilesDto> list);
	
}
