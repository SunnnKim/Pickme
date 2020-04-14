package pickme.com.a.searchJob.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.RecruitDto;

@Repository
public class SearchJobDaoImpl implements SearchJobDao{
	@Autowired
	SqlSession sqlSession;
	String ns = "Recruit.";

	@Override
	public List<RecruitDto> getRecAllList() {
		return sqlSession.selectList(ns+"getRecAllList");
	}

}
