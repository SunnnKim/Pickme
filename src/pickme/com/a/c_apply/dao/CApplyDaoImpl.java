package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CApplyDto;
import model.RecruitDto;
import model.RecruitParam;

@Repository
public class CApplyDaoImpl implements CApplyDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "CApply.";
	
	@Override
	public int getComRecCount(int seq) {
		return sqlSession.selectOne(ns + "getComRecCount", seq);
	}

	@Override
	public List<RecruitDto> myCurrentRecList(RecruitParam param) {
		return sqlSession.selectList(ns + "myCurrentRecList", param);
	}

	@Override
	public List<CApplyDto> getCApplyList(int jobSeq) {
		return sqlSession.selectList(ns + "getCApplyList", jobSeq);
	}
	
	
	
	
}
