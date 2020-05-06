package pickme.com.a.c_apply.service;

import java.util.List;

import model.AwardsEtcDto;
import model.CApplyDto;
import model.CareerDto;
import model.CvRecruitDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;

public interface CApplyService {

	public int getComRecCount(int seq);

	public List<RecruitDto> myCurrentRecList(RecruitParam param);

	public List<CApplyDto> getCApplyList(int jobSeq);

	public ResumeFileDto findResumeFile(int cvSeq);

	public ResumeAfterDto getResumeAfter(int seq);

	public List<CareerDto> getCareerAfter(int seq);

	public List<EducationDto> getEducationAfter(int seq);
	
	public List<AwardsEtcDto> getAwardsAfter(int seq);
	
	public List<LanguageDto> getLanguageAfter(int seq);
	
	public List<LinkDto> getLinkAfter(int seq);

	public boolean resumeOpenConfirm(int cvSeq);

	public int myCurrentRecCount(RecruitParam param);
	
}
