package pickme.com.a.recruit.dao;

import java.util.List;


import model.FilesDto;
import model.RecruitDto;

public interface RecruitDao {

	//마지막 ref+1 받아오기
	public int getRef();									
	
	//recruit 테이블에 마지막으로 등록된 seq 받아오기
	public int getLastSeq();		
	
	//recruit insert
	public int insertRecruit(RecruitDto dto);
	
	//files insert
	public boolean insertRecFile(List<FilesDto> list);
	
	
}
