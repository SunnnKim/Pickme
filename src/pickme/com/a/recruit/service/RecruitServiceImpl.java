package pickme.com.a.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AwardsEtcDto;
import model.CApplyDto;
import model.CMemberDto;
import model.CareerDto;
import model.EducationDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;
import pickme.com.a.recruit.dao.RecruitDao;


@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	RecruitDao dao;

	@Override
	public int getRef() {
		return dao.getRef();
	}
	@Override
	public int getLastSeq() {
		return dao.getLastSeq();
	}
	
	@Override
	public int insertRecruit(RecruitDto dto) {
		return dao.insertRecruit(dto);
	}

	@Override
	public boolean insertRecFile(List<FilesDto> list) {
		return dao.insertRecFile(list);
	}
	@Override
	public void updateImgName(int ref) {
		dao.updateImgName(ref);
	}
	@Override
	public RecruitDto getRecruitDetail(int seq) {
		return dao.getRecruitDetail(seq);
	}
	@Override
	public List<FilesDto> getRecFile(int ref) {
		return dao.getRecFile(ref);
	}
	@Override
	public List<RecruitDto> myCurrentRecList(RecruitParam param) {
		return dao.myCurrentRecList(param);
	}
	@Override
	public List<RecruitDto> myPastRecList(RecruitParam param) {
		return dao.myPastRecList(param);
	}
	@Override
	public int getComRecCount(int seq) {
		return dao.getComRecCount(seq);
	}
	@Override
	public int getComPastCount(int seq) {
		return dao.getComPastCount(seq);
	}
	@Override
	public CMemberDto getComInfo(int seq) {
		return dao.getComInfo(seq);
	}
	@Override
	public int delRecruit(int seq) {
		return dao.delRecruit(seq);
	}
	@Override
	public int recUpdate(RecruitDto dto) {
		return dao.recUpdate(dto);
	}
	@Override
	public boolean delRecFile(int ref) {
		return dao.delRecFile(ref);
	}

	@Override
	public List<RecruitDto> mainTopRec() {
		return dao.mainTopRec();
	}
	@Override
	public int insertResume(ResumeAfterDto dto) {
		return dao.insertResume(dto);
	}
	@Override
	public int insertResumeFile(ResumeFileDto file) {
		return dao.insertResumeFile(file);
	}
	@Override
	public ResumeAfterDto getSelectedResume(int seq) {
		return dao.getSelectedResume(seq);
	}
	@Override
	public List<CareerDto> getSelectedResumeCareer(int seq) {
		return dao.getSelectedResumeCareer(seq);
	}
	@Override
	public boolean insertCareerAfter(List<CareerDto> list) {
		return dao.insertCareerAfter(list);
	}
	@Override
	public List<EducationDto> getSelectedResumeEducation(int seq) {
		return dao.getSelectedResumeEducation(seq);
	}
	@Override
	public boolean insertEducationAfter(List<EducationDto> list) {
		return dao.insertEducationAfter(list);
	}
	@Override
	public List<AwardsEtcDto> getSelectedResumeAwards(int seq) {
		return dao.getSelectedResumeAwards(seq);
	}
	@Override
	public boolean insertAwardsAfter(List<AwardsEtcDto> list) {
		return dao.insertAwardsAfter(list);
	}
	@Override
	public List<LanguageDto> getSelectedResumeLanguage(int seq) {
		return dao.getSelectedResumeLanguage(seq);
	}
	@Override
	public boolean insertLanguageAfter(List<LanguageDto> list) {
		return dao.insertLanguageAfter(list);
	}
	@Override
	public List<LinkDto> getSelectedResumeLink(int seq) {
		return dao.getSelectedResumeLink(seq);
	}
	@Override
	public boolean insertLinkAfter(List<LinkDto> list) {
		return dao.insertLinkAfter(list);
	}
	@Override
	public int insertApply(CApplyDto dto) {
		return dao.insertApply(dto);
	}
	@Override
	public ResumeFileDto getResumeFile(int seq) {
		return dao.getResumeFile(seq);
	}

	
	
}
