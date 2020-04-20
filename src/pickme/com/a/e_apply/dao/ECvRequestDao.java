package pickme.com.a.e_apply.dao;

import java.util.List;
import java.util.Map;

import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;

public interface ECvRequestDao {
	
	// 현재 이력서 열람요청 리스트 얻어오기
	public List<CvReqDto> getCvReqList(CvReqParam param);
	
	public int getReqTotalCount(CvReqParam param);
	
	
	// 이력서 선택해서 수락하기
	public int doAccept(int seq);
	
	public CvCompanyDto getMainResumeSeq(int pseq);
	
	public int sendResume(CvCompanyDto dto);
	
	public int getLastId();
	
	public int putCvSeq(int seq, int cvSeq);
	
	// 지난 이력서 열람요청 리스트 얻어오기
	public List<CvReqDto> getPastCvReqList(CvReqParam param);

	public int getPastReqTotalCount(CvReqParam param);
	
	public int cvReqReject(int seq);
	
	public List<CvCompanyDto> getResumeList(int loginSeq);
	
	public int deletePastReq(int seq);
}
