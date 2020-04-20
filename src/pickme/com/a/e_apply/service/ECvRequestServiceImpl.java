package pickme.com.a.e_apply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;
import pickme.com.a.e_apply.dao.ECvRequestDao;

@Service
public class ECvRequestServiceImpl implements ECvRequestService {

	@Autowired
	ECvRequestDao dao;

	@Override
	public List<CvReqDto> getCvReqList(CvReqParam param) {
		
		return dao.getCvReqList(param);
	}

	@Override
	public int getReqTotalCount(CvReqParam param) {
		
		return dao.getReqTotalCount(param);
	}

	@Override
	public int doAccept(int seq) {
		
		return dao.doAccept(seq);
	}

	@Override
	public CvCompanyDto getMainResumeSeq(int pseq) {
		
		return dao.getMainResumeSeq(pseq);
	}

	@Override
	public int sendResume(CvCompanyDto dto) {
	 
		int result = dao.sendResume(dto);
		System.out.println("sendResumeResult: " + result);
		int cvSeq = dao.getLastId(); // CV_COMPANY테이블에 추가된 항목의 seq가져오기
		
		return cvSeq;
	}

	@Override
	public int putCvSeq(int seq, int cvSeq) {
		
		return dao.putCvSeq(seq, cvSeq);
	}

	@Override
	public List<CvReqDto> getPastCvReqList(CvReqParam param) {
		
		return dao.getPastCvReqList(param);
	}

	@Override
	public int getPastReqTotalCount(CvReqParam param) {
		
		return dao.getPastReqTotalCount(param);
	}

	@Override
	public int cvReqReject(int seq) {
		
		return dao.cvReqReject(seq);
	}

	@Override
	public List<CvCompanyDto>getResumeList(int loginSeq) {
		
		return dao.getResumeList(loginSeq);
	}

	@Override
	public int deletePastReq(int seq) {
		
		return dao.deletePastReq(seq);
	}
		
	
}
