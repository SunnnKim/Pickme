package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CApplyDto;
import model.CvRecruitDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;
import pickme.com.a.c_apply.dao.CApplyDao;
import pickme.com.a.c_apply.dao.CMsgDao;

@Service
public class CApplyServiceImpl implements CApplyService {

	@Autowired
	CApplyDao cApplyDao;


	@Override
	public int getComRecCount(int seq) {
		return cApplyDao.getComRecCount(seq);
	}

	@Override
	public List<RecruitDto> myCurrentRecList(RecruitParam param) {
		return cApplyDao.myCurrentRecList(param);
	}

	@Override
	public List<CApplyDto> getCApplyList(int jobSeq) {
		return cApplyDao.getCApplyList(jobSeq);
	}

	@Override
	public CvRecruitDto apResumeOpen(int cvSeq) {
		return cApplyDao.apResumeOpen(cvSeq);
	}

	
}
