package pickme.com.a.resume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeParam;
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
	
	// 이력서 count
	@Override
	public int ResumeCount(ResumeParam param) {		
		return dao.ResumeCount(param);
	}
	
	// 이력서 list
	@Override
	public List<ResumeDto> ResumeAllList(ResumeParam param) {
		return dao.ResumeAllList(param);
	}
	
	// 이력서 관리 이력서명 변경
	@Override
	public int ResumeNameUpdate(ResumeDto dto) {		
		return dao.ResumeNameUpdate(dto);
	}
	
	// 이력서 관리 메인 이력서 초기화 0
	@Override
	public int MainResumeReset(int memSeq) {		
		return dao.MainResumeReset(memSeq);
	}
	
	// 이력서 관리 메인 이력서 변경 1
	@Override
	public int MainResumeUpdate(int seq) {		
		return dao.MainResumeUpdate(seq);
	}
	
	// 이력서 삭제 
	@Override
	public int ResumeDelete(int seq) {		
		return dao.ResumeDelete(seq);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

}
