package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CvRequestDto;
import model.FavoriteDto;


@Repository
public class CApplyDaoImpl implements CApplyDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "CApply.";
	
	@Override
	public List<CvRequestDto> getRequestList() {
		List<CvRequestDto> list = sqlSession.selectList(ns+"getRequestList");
		return list;
	}
	
	@Override
	public int requestDelete(String seq) {
		System.out.println("seq : " + seq);
		return sqlSession.update(ns+"requestDelete", seq);		
	}
	
	@Override
	public List<CvRequestDto> requestLike() {
		List<CvRequestDto> list = sqlSession.selectList(ns+"requestLike");
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
	public boolean requestCancel(String cv_seq) {
		int n = sqlSession.update(ns + "requestCancel", cv_seq);
		return n>0?true:false;
	}
	
}
