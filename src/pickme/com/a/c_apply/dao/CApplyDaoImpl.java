package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CvRequestDto;


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
	public List<CvRequestDto> requestListList() {
		List<CvRequestDto> list = sqlSession.selectList(ns+"requestListList");
		return list;
	}
	
	
}
