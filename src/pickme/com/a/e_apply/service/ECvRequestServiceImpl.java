package pickme.com.a.e_apply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AwardsEtcDto;
import model.CareerDto;
import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;
import model.EducationDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeAfterDto;
import model.ResumeDto;
import model.ResumeFileDto;
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

//	@Override
//	public CvCompanyDto getMainResumeSeq(int pseq) {
//		
//		return dao.getMainResumeSeq(pseq);
//	}
//
//	@Override
//	public int sendResume(CvCompanyDto dto) {
//	 
//		int result = dao.sendResume(dto);
//		System.out.println("sendResumeResult: " + result);
//		int cvSeq = dao.getLastId(); // CV_COMPANY테이블에 추가된 항목의 seq가져오기
//		
//		return cvSeq;
//	}

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
	public int deletePastReq(int seq) {
		
		return dao.deletePastReq(seq);
	}

	@Override
	public ResumeAfterDto getMainResume(int pseq) {
		
		return dao.getMainResume(pseq);
	}

	@Override
	public int putResume(ResumeAfterDto rdto) {
		
		return dao.putResume(rdto);
	}

	@Override
	public int getLastId() {
		
		return dao.getLastId();
	}

	@Override
	public List<CareerDto> getCareer(int originalId) {
		
		return dao.getCareer(originalId);
	}

	@Override
	public int putCareer(CareerDto cdto) {
		
		return dao.putCareer(cdto);
	}

	@Override
	public List<AwardsEtcDto> getAwardsEtc(int originalId) {
		
		return dao.getAwardsEtc(originalId);
	}

	@Override
	public int putAwardsEtc(AwardsEtcDto adto) {
		
		return dao.putAwardsEtc(adto);
	}

	@Override
	public List<LanguageDto> getLanguage(int originalId) {
		
		return dao.getLanguage(originalId);
	}

	@Override
	public int putLanguage(LanguageDto langdto) {
		
		return dao.putLanguage(langdto);
	}

	@Override
	public List<EducationDto> getEducation(int originalId) {
		
		return dao.getEducation(originalId);
	}

	@Override
	public int putEducation(EducationDto edto) {
		
		return dao.putEducation(edto);
	}

	@Override
	public List<LinkDto> getLink(int originalId) {
		
		return dao.getLink(originalId);
	}

	@Override
	public int putLink(LinkDto linkdto) {
		
		return dao.putLink(linkdto);
	}

	@Override
	public int doAccept(int seq, int rsmSeq) {
		
		return dao.doAccept(seq, rsmSeq);
	}
	
	@Override
	public List<ResumeDto>getResumeList(int loginSeq) {
		
		return dao.getResumeList(loginSeq);
	}

	@Override
	public ResumeAfterDto getResume(int rSeq) {
		
		return dao.getResume(rSeq);
	}

	@Override
	public List<ResumeFileDto> getFilesList(int originalId) {
		
		return dao.getFilesList(originalId);
	}

	@Override
	public int putFilesDto(ResumeFileDto filesDto) {
	
		return dao.putFilesDto(filesDto);
	}
	
}
