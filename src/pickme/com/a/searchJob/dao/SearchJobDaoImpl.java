package pickme.com.a.searchJob.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberDto;
import model.FavoriteDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
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
	public int getCountRec(RecruitParam param) {
		return sqlSession.selectOne(ns+"getCountRec", param);
	}


	@Override
	public List<ResumeDto> getMyResumes(int seq) {
		return sqlSession.selectList(ns + "getMyResumes", seq);
	}
	

	@Override
	public void readCountUp(int seq) {
		sqlSession.update(ns+"readCountUp",seq);
	}

	@Override
	public boolean likePlus(FavoriteDto dto) {
		return sqlSession.insert(ns+"likeplus", dto)>0?true:false;
	}

	@Override
	public boolean likeDel(FavoriteDto dto) {
		return sqlSession.delete(ns+"likedel", dto)>0?true:false;
	}

	@Override
	public int likeRecTotal(FavoriteDto dto) {
		return sqlSession.selectOne(ns+"likeRecTotal", dto);
	}

	@Override
	public int likeCountByMem(FavoriteDto dto) {
		return sqlSession.selectOne(ns+"likeCountByMem", dto);
	}

	@Override
	public int checkIfApply(ResumeAfterDto dto) {
		return sqlSession.selectOne(ns + "checkIfApply", dto);
	}


}
