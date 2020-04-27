package pickme.com.a.c_apply.service;

import java.util.List;

import model.CApplyDto;
import model.CvRecruitDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;

public interface CApplyService {

	public int getComRecCount(int seq);

	public List<RecruitDto> myCurrentRecList(RecruitParam param);

	public List<CApplyDto> getCApplyList(int jobSeq);

	public CvRecruitDto apResumeOpen(int cvSeq);

	
}
