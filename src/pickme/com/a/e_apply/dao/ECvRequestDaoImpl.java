package pickme.com.a.e_apply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AwardsEtcDto;
import model.CareerDto;
import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeAfterDto;
import model.ResumeDto;

@Repository
public class ECvRequestDaoImpl implements ECvRequestDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "eApplyCvRequest.";

	@Override
	public List<CvReqDto> getCvReqList(CvReqParam param) {
		
		System.out.println("sKeyword" + param.getsKeyword());
		return sqlSession.selectList(ns + "getCvReqList", param);
	}

	@Override
	public int getReqTotalCount(CvReqParam param) {
		
		return sqlSession.selectOne(ns + "getReqTotalCount", param);
	}

	@Override
	public CvCompanyDto getMainResumeSeq(int pseq) {
		
		return sqlSession.selectOne(ns + "getMainResumeSeq", pseq);
	}

	@Override
	public int sendResume(CvCompanyDto dto) {
		
		return sqlSession.insert(ns + "sendResume", dto);
	}

	@Override
	public int getLastId() {
		
		return sqlSession.selectOne(ns + "getLastId");
	}

	@Override
	public int putCvSeq( int seq, int cvSeq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("seq", seq);
		map.put("cvSeq", cvSeq);
		
		return sqlSession.update(ns + "putCvSeq", map);
	}

	@Override
	public List<CvReqDto> getPastCvReqList(CvReqParam param) {
		
		List<CvReqDto> pastCvReqList = sqlSession.selectList(ns + "getPastCvReqList", param);
		
		System.out.println("pastCvReqList: " + pastCvReqList.size());
		return pastCvReqList;
	}

	@Override
	public int getPastReqTotalCount(CvReqParam param) {
		
		return sqlSession.selectOne(ns + "getPastReqTotalCount", param);
	}

	@Override
	public int cvReqReject(int seq) {
		
		return sqlSession.update(ns + "cvReqReject", seq);
	}


	@Override
	public int deletePastReq(int seq) {
		
		return sqlSession.update(ns + "deletePastReq", seq);
	}

	@Override
	public ResumeAfterDto getMainResume(int pseq) {
		
		return sqlSession.selectOne(ns + "getMainResume", pseq);
	}

	@Override
	public int putResume(ResumeAfterDto rdto) {
		
		return sqlSession.insert(ns + "putResume", rdto);
	}

	@Override
	public CareerDto getCareer(int originalId) {
		
		return sqlSession.selectOne(ns + "getCareer", originalId);
	}

	@Override
	public int putCareer(CareerDto cdto) {
		
		return sqlSession.insert(ns + "putCareer", cdto);
	}

	@Override
	public AwardsEtcDto getAwardsEtc(int originalId) {
		
		return sqlSession.selectOne(ns + "getAwardsEtc", originalId);
	}

	@Override
	public int putAwardsEtc(AwardsEtcDto adto) {
		
		return sqlSession.insert(ns + "putAwardsEtc" , adto);
	}

	@Override
	public LanguageDto getLanguage(int originalId) {
		
		return sqlSession.selectOne(ns + "getLanguage", originalId);
	}

	@Override
	public int putLanguage(LanguageDto langdto) {
		
		return sqlSession.insert(ns + "putLanguage", langdto);
	}

	@Override
	public EducationDto getEducation(int originalId) {
		
		return sqlSession.selectOne(ns + "getEducation", originalId);
	}

	@Override
	public int putEducation(EducationDto edto) {
	
		return sqlSession.insert(ns + "putEducation", edto);
	}

	@Override
	public LinkDto getLink(int originalId) {
		
		return sqlSession.selectOne(ns + "getLink", originalId);
	}

	@Override
	public int putLink(LinkDto linkdto) {
		
		return sqlSession.insert(ns + "putLink", linkdto);
	}

	@Override
	public int doAccept(int seq, int rsmSeq) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq", seq);
		map.put("rsmSeq", rsmSeq);
		return sqlSession.update(ns + "doAccept", map);
	}
	

	@Override
	public List<ResumeDto> getResumeList(int loginSeq) {
		
		List<ResumeDto> list = sqlSession.selectList(ns + "getResumeList", loginSeq);
		System.out.println("list.size():" + list.size());	
		return list;
	}

	@Override
	public ResumeAfterDto getResume(int rseq) {
		
		return sqlSession.selectOne(ns + "getResume", rseq);
	}

}
