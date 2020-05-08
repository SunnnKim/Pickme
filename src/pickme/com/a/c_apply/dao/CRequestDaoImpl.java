package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AMemberDto;
import model.CvCompanyDto;
import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageDto;
import model.MessageParam;


@Repository
public class CRequestDaoImpl implements CRequestDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "CRequest.";
	
	@Override
	public List<CvRequestDto> getRequestList(int c_seq) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "getRequestList", c_seq);
		return list;
	}
	
	@Override
	public List<CvRequestDto> getRequestList(MessageParam param) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "getRequestList", param);
		return list;
	}
	
	@Override
	public int requestDelete(String seq) {
		System.out.println("requestDelete seq : " + seq);
		return sqlSession.update(ns+"requestDelete", seq);		
	}
	
	@Override
	public List<CvRequestDto> requestLike(int c_seq) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "requestLike", c_seq);
		return list;
	}
	
	@Override
	public List<CvRequestDto> requestLike(MessageParam param) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "requestLike", param);
		return list;
	}

	@Override
	public boolean addLike(FavoriteDto dto) {
		int n = sqlSession.insert(ns + "addLike", dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean delLike(FavoriteDto dto) {
		int n = sqlSession.delete(ns + "delLike", dto);
		return n>0?true:false;
	}

	@Override
	public int requestCancel(String cv_seq) {
		return sqlSession.update(ns + "requestCancel", cv_seq);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		int totalRecordCount = sqlSession.selectOne(ns + "getTotalRecordCount",param);
		return totalRecordCount;
	}
	
	@Override
	public int getLikeTotalRecordCount(MessageParam param) {
		int totalRecordCount = sqlSession.selectOne(ns + "getLikeTotalRecordCount",param);
		return totalRecordCount;
	}

	@Override
	public CvCompanyDto reqResumeOpen(CvRequestDto dto) {
		return sqlSession.selectOne(ns + "reqResumeOpen", dto);
	}

	@Override
	public AMemberDto getaMemberProfile(String seq) {
		return sqlSession.selectOne(ns + "getaMemberProfile", seq);
	}

	@Override
	public boolean setResumeOpen(int cvSeq) {
		int n = sqlSession.update(ns + "setResumeOpen", cvSeq);
		return (n>0)?true:false;
	}

	
	
	
	
	
	
	
	
	
	
}
