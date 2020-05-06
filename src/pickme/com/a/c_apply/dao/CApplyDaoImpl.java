package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AwardsEtcDto;
import model.CApplyDto;
import model.CareerDto;
import model.CvRecruitDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;

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

	
	/* 지원자 현황 이력서 file 판별 */
	@Override
	public ResumeFileDto findResumeFile(int cvSeq) {
		int n = sqlSession.selectOne(ns + "findResumeFile", cvSeq);
		if(n==0) {
			System.out.println(">>>>>>>>>>>>> findResumeFile NULL ");
			return null;
		} else {
			System.out.println(">>>>>>>>>>>>> findResumeFile  ");
			return sqlSession.selectOne(ns + "getResumeFile", cvSeq);
		}
	}

	/* 지원자 현황 이력서 뷰 내용 취득 */
	@Override
	public ResumeAfterDto getResumeAfter(int seq) {
		return sqlSession.selectOne(ns + "getResumeAfter", seq);
	}

	@Override
	public List<CareerDto> getCareerAfter(int seq) {
		return sqlSession.selectList(ns+"getCareerAfter", seq);
	}

	@Override
	public List<EducationDto> getEducationAfter(int seq) {
		return sqlSession.selectList(ns+"getEducationAfter", seq);
	}

	@Override
	public List<AwardsEtcDto> getAwardsAfter(int seq) {
		return sqlSession.selectList(ns+"getAwardsAfter", seq);
	}

	@Override
	public List<LanguageDto> getLanguageAfter(int seq) {
		return sqlSession.selectList(ns+"getLanguageAfter", seq);
	}

	@Override
	public List<LinkDto> getLinkAfter(int seq) {
		return sqlSession.selectList(ns+"getLinkAfter", seq);
	}

	@Override
	public boolean resumeOpenConfirm(int cvSeq) {
		int n = sqlSession.update(ns + "resumeOpenConfirm", cvSeq);
		return (n>0)?true:false;
	}

	@Override
	public int myCurrentRecCount(RecruitParam param) {
		return sqlSession.selectOne(ns + "myCurrentRecCount", param);
	}
	
	
	
}
