package pickme.com.a.searchJob.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FilesDto;
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
	
	@Override
	public int getCountRec() {
		return sqlSession.selectOne(ns+"getCountRec");
	}


	@Override
	public RecruitDto getRecruitDetail(int seq) {
		return sqlSession.selectOne(ns+"getRecruitDetail", seq);
	}


	@Override
	public List<FilesDto> getRecFile(int ref) {
		return sqlSession.selectList(ns+"getRecFile", ref);
	}

	@Override
	public int countFiles(int ref) {
		return sqlSession.selectOne(ns+"countFiles", ref);
	}

	@Override
	public String getAddr(int seq) {
		return sqlSession.selectOne(ns+"getAddr", seq);
	}


}
