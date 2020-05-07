package pickme.com.a.e_apply.service;

import java.util.List;

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


public interface ECvRequestService {
	
	public List<CvReqDto> getCvReqList(CvReqParam param);

	public int getReqTotalCount(CvReqParam param);
	
//	public CvCompanyDto getMainResumeSeq(int pseq);
//	
//	public int sendResume(CvCompanyDto dto);
	
	public int putCvSeq(int seq, int cvSeq);
	
	public List<CvReqDto> getPastCvReqList(CvReqParam param);
	
	public int getPastReqTotalCount(CvReqParam param);
	
	public int cvReqReject(int seq);

	public int deletePastReq(int seq);	
	
	public ResumeAfterDto getMainResume(int pseq);
	
	public int putResume(ResumeAfterDto rdto); 
	
	public int getLastId();
	
	public List<CareerDto> getCareer(int originalId);
	
	public int putCareer(CareerDto cdto);
	
	public List<AwardsEtcDto> getAwardsEtc(int originalId);
	
	public int putAwardsEtc(AwardsEtcDto adto);
	
	public List<LanguageDto> getLanguage(int originalId);
	
	public int putLanguage(LanguageDto langdto);
	
	public List<EducationDto> getEducation(int originalId);
	
	public int putEducation(EducationDto edto);
	
	public List<LinkDto> getLink(int origianlId);
	
	public int putLink(LinkDto linkdto);
	
	public int doAccept(int seq, int rsmSeq);
	
	public List<ResumeDto>getResumeList(int loginSeq);
	
	public ResumeAfterDto getResume(int rSeq);
	
	public List<ResumeFileDto> getFilesList(int originalId);
	
	public int putFilesDto(ResumeFileDto filesDto);
}
