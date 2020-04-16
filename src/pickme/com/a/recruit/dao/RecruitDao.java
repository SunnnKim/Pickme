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
	
	//file insert -> recruit table imagename -> newname 
	public void updateImgName(int ref);
	
	//(기업) 로그인한 기업이 볼 수 있는 현재공고
	public List<RecruitDto> myCurrentRecList(int seq);
	
	//(기업) 로그인한 기업이 볼 수 있는 지난공고
	public List<RecruitDto> myPastRecList(int seq);
	
	
}
