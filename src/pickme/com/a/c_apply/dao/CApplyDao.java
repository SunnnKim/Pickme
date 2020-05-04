package pickme.com.a.c_apply.dao;

import java.util.List;

import model.CApplyDto;
import model.CareerDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;

public interface CApplyDao {

	public int getComRecCount(int seq);

	public List<RecruitDto> myCurrentRecList(RecruitParam param);

	public List<CApplyDto> getCApplyList(int jobSeq);

	public ResumeFileDto findResumeFile(int cvSeq);

	public ResumeAfterDto getResumeAfter(int seq);

	public List<CareerDto> getCareerAfter(int seq);


}
