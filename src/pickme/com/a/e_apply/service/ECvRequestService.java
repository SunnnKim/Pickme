package pickme.com.a.e_apply.service;

import java.util.List;

import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;

public interface ECvRequestService {
	
	public List<CvReqDto> getCvReqList(CvReqParam param);

	public int getReqTotalCount(CvReqParam param);
	
	public int doAccept(int seq);
	
	public CvCompanyDto getMainResumeSeq(int pseq);
	
	public int sendResume(CvCompanyDto dto);
	
	public int putCvSeq(int seq, int cvSeq);
	
	public List<CvReqDto> getPastCvReqList(CvReqParam param);
	
	public int getPastReqTotalCount(CvReqParam param);
	
	public int cvReqReject(int seq);
	
	public List<CvCompanyDto>getResumeList(int loginSeq);

	public int deletePastReq(int seq);	
}
