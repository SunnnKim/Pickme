package pickme.com.a.resume.service;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;

public interface ResumeService {
	
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

}
