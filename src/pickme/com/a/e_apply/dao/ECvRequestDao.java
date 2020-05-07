package pickme.com.a.e_apply.dao;

import java.util.List;
import java.util.Map;

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

public interface ECvRequestDao {
	
	// 현재 이력서 열람요청 리스트 얻어오기
	public List<CvReqDto> getCvReqList(CvReqParam param);
	
	public int getReqTotalCount(CvReqParam param);
	
	
	// 이력서 선택해서 수락하기
	
//	public CvCompanyDto getMainResumeSeq(int pseq);
	
	public int getLastId();
	
	public int putCvSeq(int seq, int cvSeq);
	
	// 지난 이력서 열람요청 리스트 얻어오기
	public List<CvReqDto> getPastCvReqList(CvReqParam param);

	public int getPastReqTotalCount(CvReqParam param);
	
	public int cvReqReject(int seq);
	
	public int deletePastReq(int seq);
	
	
	
	//최종)  이력서 받아오기 
	
	public ResumeAfterDto getMainResume(int pseq);
	
	public int putResume(ResumeAfterDto rdto);
	
	public List<CareerDto> getCareer(int originalId);
	
	public int putCareer(CareerDto cdto);
	
	public List<AwardsEtcDto> getAwardsEtc(int originalId);
	
	public int putAwardsEtc(AwardsEtcDto adto);
	
	public List<LanguageDto> getLanguage(int originalId);
	
	public int putLanguage(LanguageDto langdto);
	
	public List<EducationDto> getEducation(int originalId);
	
	public int putEducation(EducationDto edto);
	
	public List<LinkDto> getLink(int originalId);
	
	public int putLink(LinkDto linkdto);
	
	public List<ResumeFileDto> getFilesList(int originalId);
	
	public int putFilesDto(ResumeFileDto filesDto);
	
	public int doAccept(int seq, int rsmSeq);
	
	public List<ResumeDto> getResumeList(int loginSeq);
	
	public ResumeAfterDto getResume(int rseq);
	
	
}
