package pickme.com.a.searchJob.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeDto;

@Repository
public class SearchJobDaoImpl implements SearchJobDao{
	@Autowired
	SqlSession sqlSession;
	String ns = "Recruit.";

	@Override
	public List<RecruitDto> getRecAllList(RecruitParam param) {
		return sqlSession.selectList(ns+"getRecAllList", param);
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
	public CMemberDto getAddr(int seq) {
		return sqlSession.selectOne(ns+"getAddr", seq);
	}

	@Override
	public List<ResumeDto> getMyResumes(int seq) {
		return sqlSession.selectList(ns + "getMyResumes", seq);
	}
	

	@Override
	public void readCountUp(int seq) {
		sqlSession.update(ns+"readCountUp",seq);
	}


}
