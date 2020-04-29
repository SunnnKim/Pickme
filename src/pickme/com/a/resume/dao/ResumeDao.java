package pickme.com.a.resume.dao;

import java.util.List;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeParam;

public interface ResumeDao {
	
	// resume seq+1 
	public int resumeGetSeq();		
	
	// 이력서 기본 정보 insert 
	public int resumeInsert(ResumeDto dto);
	
	// 경력 insert 
	public int careerInsert(CareerDto dto);
	
	// 학력 insert 
	public int educationInsert(EducationDto dto);
	
	// 수상 및 기타 insert 
	public int AwardsEtcInsert(AwardsEtcDto dto);
	
	// 외국어 insert 
	public int LanguageInsert(LanguageDto dto);
	
	// 링크 insert 
	public int LinkInsert(LinkDto dto);
	
	// 총 이력서 개수
	public int ResumeCount(ResumeParam param);
	
	// 이력서 list
	List<ResumeDto> ResumeAllList(ResumeParam param);
	
	// 이력서 관리 이력서명 변경
	public int ResumeNameUpdate(ResumeDto dto);
	
	// 이력서 관리 메인 이력서 초기화 0
	public int MainResumeReset(int memSeq);
		
	// 이력서 관리 메인 이력서 변경 1
	public int MainResumeUpdate(int seq);
	
	// 이력서 삭제
	public int ResumeDelete(int seq);
	
}
