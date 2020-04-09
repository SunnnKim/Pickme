package pickme.com.a.e_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.EApplyDto;
import model.MessageParam;
import pickme.com.a.e_apply.dao.EApplyDao;

@Service
public class EApplyServiceImpl implements EApplyService{

	@Autowired
	EApplyDao dao;

	@Override
	public List<EApplyDto> getCurAList(MessageParam param) {
		
		return dao.getCurAList(param);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		
		return dao.getTotalRecordCount(param);
	}

	@Override
	public int cancelApply(int seq) {
		
		return dao.cancelApply(seq);
	}

	@Override
	public int[] deleteApply(int[] seqArray) {
	
		return dao.deleteApply(seqArray);
	}
	
	public List<EApplyDto> getPastAList(MessageParam param){
		
		return dao.getPastAList(param);
	}

	@Override
	public int getTotalPastCount(MessageParam param) {
		
		return dao.getTotalPastCount(param);
	}
	
	
	
	
	
}
