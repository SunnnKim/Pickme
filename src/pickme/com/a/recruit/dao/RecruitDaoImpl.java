package pickme.com.a.recruit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AwardsEtcDto;
import model.CApplyDto;
import model.CMemberDto;
import model.CareerDto;
import model.EducationDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;

@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "Recruit.";

	@Override
	public int getRef() {
		return sqlSession.selectOne(ns+"recGetRef");
	}
	

	@Override
	public int getLastSeq() {
		return sqlSession.selectOne(ns + "getLastSeq");
	}
	
	@Override
	public int insertRecruit(RecruitDto dto) {
		//채용등록 등록
		int count = sqlSession.insert(ns + "recInsert", dto);
		return count;
	}

	@Override
	public boolean insertRecFile(List<FilesDto> list) {
		// 등록한 첨부파일목록을 디비에 넣기 
		for( int i = 0; i < list.size(); i++) {
			FilesDto file = list.get(i);
			if(file.getOriginname().trim() != "") {
				int result = sqlSession.insert(ns + "recUpfile", file);
				if(result == 0) {
					return false;
				}

			}
		}
		return true;
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
	public void updateImgName(int ref) {
		sqlSession.update(ns+"imageNameUpdate", ref);
	}


	@Override
	public List<RecruitDto> myCurrentRecList(RecruitParam param) {
		return sqlSession.selectList(ns+"getMyRecruitNow", param);
	}
	
	@Override
	public List<RecruitDto> myPastRecList(RecruitParam param) {
		return sqlSession.selectList(ns+"getMyRecruitPast", param);
	}


	@Override
	public int getComRecCount(int seq) {
		return sqlSession.selectOne(ns+"getComRecCount", seq);
	}


	@Override
	public int getComPastCount(int seq) {
		return sqlSession.selectOne(ns+"getComPastCount",seq);
	}


	@Override
	public CMemberDto getComInfo(int seq) {
		return sqlSession.selectOne(ns+"getComInfo", seq);
	}


	@Override
	public int delRecruit(int seq) {
		return sqlSession.update(ns+"delRecruit", seq);
	}


	@Override
	public int recUpdate(RecruitDto dto) {
		return sqlSession.update(ns+"recUpdate",dto);
	}


	@Override
	public boolean delRecFile(int ref) {
		return sqlSession.delete(ns+"delRecFile",ref)>0?true:false;
	}


	@Override
	public List<RecruitDto> mainTopRec() {
		return sqlSession.selectList(ns+"mainTopRecruit");
	}


	@Override
	public int insertResume(ResumeAfterDto dto) {
		sqlSession.insert(ns + "insertResume", dto);
		return sqlSession.selectOne(ns + "getResumeLastSeq");
	}


	@Override
	public int insertResumeFile(ResumeFileDto file) {
		return sqlSession.insert(ns + "insertResumeFile", file);
	}


	@Override
	public ResumeAfterDto getSelectedResume(int seq) {
		return sqlSession.selectOne(ns + "getSelectedResume", seq);
	}


	@Override
	public List<CareerDto> getSelectedResumeCareer(int seq) {
		return sqlSession.selectList(ns + "getSelectedResumeCareer", seq);
	}


	@Override
	public boolean insertCareerAfter(List<CareerDto> list) {
		return sqlSession.insert(ns + "insertCareerAfter", list) > 0 ? true:false;
	}


	@Override
	public List<EducationDto> getSelectedResumeEducation(int seq) {
		return sqlSession.selectList(ns + "getSelectedResumeEducation", seq);
	}


	@Override
	public boolean insertEducationAfter(List<EducationDto> list) {
		return sqlSession.insert(ns + "insertEducationAfter", list) > 0 ? true:false;
	}


	@Override
	public List<AwardsEtcDto> getSelectedResumeAwards(int seq) {
		return sqlSession.selectList(ns + "getSelectedResumeAwards", seq);
	}


	@Override
	public boolean insertAwardsAfter(List<AwardsEtcDto> list) {
		return sqlSession.insert(ns + "insertAwardsAfter", list) > 0 ? true:false;
	}


	@Override
	public List<LanguageDto> getSelectedResumeLanguage(int seq) {
		return sqlSession.selectList(ns + "getSelectedResumeLanguage", seq);
	}


	@Override
	public boolean insertLanguageAfter(List<LanguageDto> list) {
		return sqlSession.insert(ns+"insertLanguageAfter", list) > 0 ? true:false;
	}


	@Override
	public List<LinkDto> getSelectedResumeLink(int seq) {
		return sqlSession.selectList(ns + "getSelectedResumeLink", seq);
	}


	@Override
	public boolean insertLinkAfter(List<LinkDto> list) {
		return sqlSession.insert(ns + "insertLinkAfter", list) > 0 ? true:false;
	}


	@Override
	public int insertApply(CApplyDto dto) {
		return sqlSession.insert(ns + "insertApply", dto);
	}


	@Override
	public ResumeFileDto getResumeFile(int seq) {
		return sqlSession.selectOne(ns + "getResumeFile", seq);
	}


	/*
	 * @Override public void dayUpdateDel(String today) {
	 * sqlSession.update(ns+"dayUpdateDel", today); }
	 */


	




}
