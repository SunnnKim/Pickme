package pickme.com.a.c_apply.service;

import java.util.List;

import model.RecruitDto;
import model.RecruitParam;

public interface CApplyService {

	public int getComRecCount(int seq);

	public List<RecruitDto> myCurrentRecList(RecruitParam param);

}
