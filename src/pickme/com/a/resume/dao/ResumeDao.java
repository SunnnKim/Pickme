package pickme.com.a.resume.dao;

import java.util.HashMap;
import java.util.List;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeFileDto;
import model.ResumeParam;

public interface ResumeDao {
	
	// resume seq+1 
	public int resumeGetSeq();		
	
	// 이력서 파일 select
	public ResumeFileDto resumeFileSelect(int seq);
	
	// 이력서 파일 insert
	public int resumeFileInsert(ResumeFileDto fileDto);
	
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
	
	// 이력서 list paging
	public List<ResumeDto> ResumeAllList(ResumeParam param);
	
	// 이력서 list ajax
	public List<ResumeDto> ResumeAllList02(ResumeDto dto);
	
	// 이력서 관리 이력서명 변경
	public int ResumeNameUpdate(ResumeDto dto);
	
	// 이력서 관리 메인 이력서 초기화 0
	public int MainResumeReset(int memSeq);
		
	// 이력서 관리 메인 이력서 변경 1
	public int MainResumeUpdate(int seq);
	
	// 이력서 삭제
	public int ResumeDelete(int seq);
	
	// 이력서 detail 이력서 기본정보
	public ResumeDto ResumeDetail(HashMap<String, Integer> map);

	// 이력서 detail 경력 
	public List<CareerDto> CareerDetail(int rsmseq);
	
	// 이력서 detail 학력 
	public List<EducationDto> educationDetail(int rsmseq);
	
	// 이력서 detail 수상 및 기타 
	public List<AwardsEtcDto> AwardsEtcDetail(int rsmseq);
		
	// 이력서 detail 외국어 
	public List<LanguageDto> LanguageDetail(int rsmseq);
	
	// 이력서 detail 링크 
	public List<LinkDto> LinkDetail(int rsmseq);
	
	// 이력서 delete 경력
	public int careerDelete(int seq); 
	
	// 이력서 delete 학력
	public int educationDelete(int seq);
		
	// 이력서 delete 수상 및 기타
	public int awardsEtcDelete(int seq);
	
	// 이력서 delete 외국어
	public int languageDelete(int seq);
	
	// 이력서 delete 링크
	public int linkDelete(int seq);
	
	// 이력서 delete 파일
	public int fileDelete(int rsmSeq);	
	
	// 이력서	update 기본정보
	public int resumeUpdate(ResumeDto dto);
	
	// 이력서 update 경력
	public int careerUpdate(CareerDto dto);
	
	// 이력서 update 학력
	public int educationUpdate(EducationDto dto);
	
	// 이력서 update 수상 및 기타
	public int AwardsEtcUpdate(AwardsEtcDto dto);
	
	// 이력서 update 외국어
	public int LanguageUpdate(LanguageDto dto);
	
	// 이력서 update 링크
	public int LinkUpdate(LinkDto dto);
	
	// 이력서 delete 경력 전체
	public int careerDeleteAll(int rsmseq);
	
	// 이력서 delete 학력 전체
	public int educationDeleteAll(int rsmseq);
		
	// 이력서 delete 수상 및 기타 전체
	public int awardsEtcDeleteAll(int rsmseq);
	
	// 이력서 delete 외국어 전체
	public int languageDeleteAll(int rsmseq);
	
	// 이력서 delete 링크 전체
	public int linkDeleteAll(int rsmseq);
	

	
}
