package pickme.com.a.e_apply.service;

import java.util.List;

import model.EApplyDto;
import model.EApplyParam;


public interface EApplyService {
	
	public List<EApplyDto> getCurAList(EApplyParam param);
	
	public int getTotalRecordCount(EApplyParam param);
	
	
	public int cancelApply(int seq);
	
	public int deleteApply(int seqArray);
	
	public List<EApplyDto> getPastAList(EApplyParam param);
	
	public int getTotalPastCount(EApplyParam param);
	
}
