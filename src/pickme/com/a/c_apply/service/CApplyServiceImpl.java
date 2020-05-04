package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CApplyDto;
import model.CareerDto;
import model.CvRecruitDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;
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

	
	/* 지원자 현황 이력서 file 판별 */
	@Override
	public ResumeFileDto findResumeFile(int cvSeq) {
		return cApplyDao.findResumeFile(cvSeq);
	}

	/* 지원자 현황 이력서 뷰 내용 취득 */
	@Override
	public ResumeAfterDto getResumeAfter(int seq) {
		return cApplyDao.getResumeAfter(seq);
	}

	@Override
	public List<CareerDto> getCareerAfter(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
