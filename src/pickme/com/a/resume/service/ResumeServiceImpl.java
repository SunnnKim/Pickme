package pickme.com.a.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.ResumeDto;
import pickme.com.a.resume.dao.ResumeDao;


@Service
public class ResumeServiceImpl implements ResumeService{
	
	@Autowired
	ResumeDao dao;
	
	// 이력서 시퀀스 + 1	
	@Override
	public int resumeGetSeq() {
		return dao.resumeGetSeq();
	}
	
	// 이력서 insert 
	@Override
	public int resumeInsert(ResumeDto dto) {
		return dao.resumeInsert(dto);
	}	
	
	
	// 경력 insert
	@Override
	public int careerInsert(CareerDto dto) {
		return dao.careerInsert(dto);
	}
	
	
	// 학력 insert
	@Override
	public int educationInsert(EducationDto dto) {
		return dao.educationInsert(dto);
	}
	
	
	// 수상 및 기타 insert
	@Override
	public int AwardsEtcInsert(AwardsEtcDto dto) {
		return dao.AwardsEtcInsert(dto);
	}
	
	// 외국어 insert
	@Override
	public int LanguageInsert(LanguageDto dto) {
		return dao.LanguageInsert(dto);
	}
	
	// 링크 insert
	@Override
	public int LinkInsert(LinkDto dto) {
		return dao.LinkInsert(dto);
	}

	

}
