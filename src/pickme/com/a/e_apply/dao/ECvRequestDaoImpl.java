package pickme.com.a.e_apply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;

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
	public int doAccept(int seq) {
		
		return sqlSession.update(ns + "doAccept", seq);
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
	public List<CvCompanyDto> getResumeList(int loginSeq) {
		
		List<CvCompanyDto> list = sqlSession.selectList(ns + "getResumeList", loginSeq);
		System.out.println("list.size():" + list.size());
	
		
		return list;
	}

	@Override
	public int deletePastReq(int seq) {
		
		return sqlSession.update(ns + "deletePastReq", seq);
	}
	

}
