package pickme.com.a.e_apply.service;

import java.util.List;

import model.EApplyDto;
import model.MessageParam;

public interface EApplyService {
	
	public List<EApplyDto> getCurAList(MessageParam param);
	
	public int getTotalRecordCount(MessageParam param);
	
	
	public int cancelApply(int seq);
	
	public int[] deleteApply(int[] seqArray);
	
	public List<EApplyDto> getPastAList(MessageParam param);
	
	public int getTotalPastCount(MessageParam param);
	
}
