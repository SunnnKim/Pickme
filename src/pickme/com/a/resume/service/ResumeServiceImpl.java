package pickme.com.a.resume.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeFileDto;
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
	
	// 이력서 파일 select
	@Override
	public ResumeFileDto resumeFileSelect(int seq) {
		return dao.resumeFileSelect(seq);
	}
	
	// 이력서 파일 insert 
	@Override
	public int resumeFileInsert(ResumeFileDto fileDto) {
		return dao.resumeFileInsert(fileDto);
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
	
	// 이력서 list paging
	@Override
	public List<ResumeDto> ResumeAllList(ResumeParam param) {
		return dao.ResumeAllList(param);
	}
	
	// 이력서 list ajax
	@Override
	public List<ResumeDto> ResumeAllList02(ResumeDto dto) {
		return dao.ResumeAllList02(dto);
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
	
	// 이력서 detail 이력서 기본정보
	@Override
	public ResumeDto ResumeDetail(HashMap<String, Integer> map) {		
		return dao.ResumeDetail(map);
	}
	
	// 이력서 detail 경력
	@Override
	public List<CareerDto> CareerDetail(int rsmseq) {
		return dao.CareerDetail(rsmseq);
	}
	
	// 이력서 detail 학력
	@Override
	public List<EducationDto> educationDetail(int rsmseq) {
		return dao.educationDetail(rsmseq);
	}
	
	// 이력서 detail 수상 및 기타
	@Override
	public List<AwardsEtcDto> AwardsEtcDetail(int rsmseq) {
		return dao.AwardsEtcDetail(rsmseq);
	}
	
	// 이력서 detail 외국어
	@Override
	public List<LanguageDto> LanguageDetail(int rsmseq) {
		return dao.LanguageDetail(rsmseq);
	}
	
	// 이력서 detail 링크
	@Override
	public List<LinkDto> LinkDetail(int rsmseq) {
		return dao.LinkDetail(rsmseq);
	}
	
	// 이력서 delete 경력
	@Override
	public int careerDelete(int seq) {
		return dao.careerDelete(seq);
	}
	
	// 이력서 delete 학력
	@Override
	public int educationDelete(int seq) {
		return dao.educationDelete(seq);
	}
	
	// 이력서 delete 수상 및 기타
	@Override
	public int awardsEtcDelete(int seq) {
		return dao.awardsEtcDelete(seq);
	}
	
	// 이력서 delete 외국어
	@Override
	public int languageDelete(int seq) {
		return dao.languageDelete(seq);
	}
	
	// 이력서 delete 링크
	@Override
	public int linkDelete(int seq) {
		return dao.linkDelete(seq);
	}
	
	// 이력서 delete 파일
	public int fileDelete(int rsmSeq) {
		return dao.fileDelete(rsmSeq);
	}
	
	// 이력서 update 기본 정보
	@Override
	public int resumeUpdate(ResumeDto dto) {
		return dao.resumeUpdate(dto);
	}
	
	// 이력서 update 경력
	@Override
	public int careerUpdate(CareerDto dto) {
		return dao.careerUpdate(dto);
	}
	
	// 이력서 update 학력
	@Override
	public int educationUpdate(EducationDto dto) {
		return dao.educationUpdate(dto);
	}
	
	// 이력서 update 수상 및 기타
	@Override
	public int AwardsEtcUpdate(AwardsEtcDto dto) {
		return dao.AwardsEtcUpdate(dto);
	}
	
	// 이력서 update 외국어
	@Override
	public int LanguageUpdate(LanguageDto dto) {
		return dao.LanguageUpdate(dto);
	}
	
	// 이력서 update 링크
	@Override
	public int LinkUpdate(LinkDto dto) {
		return dao.LinkUpdate(dto);
	}
	
	// 경력 전체 삭제 
	@Override
	public int careerDeleteAll(int rsmseq) {
		return dao.careerDeleteAll(rsmseq);
	}
	
	// 학력 전체 삭제 
	@Override
	public int educationDeleteAll(int rsmseq) {
		return dao.educationDeleteAll(rsmseq);
	}
	
	// 수상 및 기타 전체 삭제 
	@Override
	public int awardsEtcDeleteAll(int rsmseq) {
		return dao.awardsEtcDeleteAll(rsmseq);
	}
	
	// 외국어 전체 삭제 
	@Override
	public int languageDeleteAll(int rsmseq) {
		return dao.languageDeleteAll(rsmseq);
	}

	// 링크 전체 삭제 
	@Override
	public int linkDeleteAll(int rsmseq) {
		return dao.linkDeleteAll(rsmseq);
	}



	

	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

}
