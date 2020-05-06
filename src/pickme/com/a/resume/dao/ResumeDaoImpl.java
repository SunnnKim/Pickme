package pickme.com.a.resume.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeFileDto;
import model.ResumeParam;

@Repository
public class ResumeDaoImpl implements ResumeDao{
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "Resume.";
	
	// 이력서 시퀀스 + 1
	@Override
	public int resumeGetSeq() {
		return sqlSession.selectOne(namespace + "resumeGetSeq");
	}
	
	
	// 이력서 파일 select
	@Override
	public ResumeFileDto resumeFileSelect(int seq) {
		return sqlSession.selectOne(namespace + "resumeFileSelect", seq);
	}
	
	// 이력서 파일 insert
	@Override
	public int resumeFileInsert(ResumeFileDto fileDto) {
		return sqlSession.insert(namespace + "resumeFileInsert", fileDto);
	}
		
	// 이력서 기본 정보  insert 
	@Override
	public int resumeInsert(ResumeDto dto) {
		int count = sqlSession.insert(namespace + "resumeInsert", dto);
		return count;
	}
	
	
	// 경력  insert 
	@Override
	public int careerInsert(CareerDto dto) {
		int count = sqlSession.insert(namespace + "careerInsert", dto);
		return count;
	}
	
	
	// 학력 insert
	@Override
	public int educationInsert(EducationDto dto) {
		int count = sqlSession.insert(namespace + "educationInsert", dto);
		return count;
	}
	
	// 수상 및 기타 insert
	@Override
	public int AwardsEtcInsert(AwardsEtcDto dto) {
		int count = sqlSession.insert(namespace + "AwardsEtcInsert", dto);
		return count;
	}
	
	// 외국어 insert
	@Override
	public int LanguageInsert(LanguageDto dto) {
		int count = sqlSession.insert(namespace + "LanguageInsert", dto);
		return count;
	}
	
	// 링크 insert
	@Override
	public int LinkInsert(LinkDto dto) {
		int count = sqlSession.insert(namespace + "LinkInsert", dto);
		return count;
	}
	
	
	// 이력서 총 개수
	@Override
	public int ResumeCount(ResumeParam param) {
		return sqlSession.selectOne(namespace + "ResumeCount" , param);
	}
	
	// 이력서 관리 list paging
	@Override
	public List<ResumeDto> ResumeAllList(ResumeParam param) {
		return sqlSession.selectList(namespace + "ResumeAllList" , param);
	}
	
	// 이력서 관리 list ajax
	@Override
	public List<ResumeDto> ResumeAllList02(ResumeDto dto) {
		return sqlSession.selectList(namespace + "ResumeAllList02" , dto);
	}

	// 이력서 관리 이력서명 변경
	@Override
	public int ResumeNameUpdate(ResumeDto dto) {
		int count = sqlSession.update(namespace + "ResumeNameUpdate", dto);
		return count;
	}
	
	// 이력서 관리 메인 이력서 초기화 0
	@Override
	public int MainResumeReset(int memSeq) {
		int count = sqlSession.update(namespace + "MainResumeReset", memSeq);
		return count;
	}
	
	// 이력서 관리 메인 이력서 변경 1
	@Override
	public int MainResumeUpdate(int seq) {
		int count = sqlSession.update(namespace + "MainResumeUpdate", seq);
		return count;
	}
	
	// 이력서 삭제
	@Override
	public int ResumeDelete(int seq) {
		int count = sqlSession.update(namespace + "ResumeDelete", seq);
		return count;
	}
	
	
	// 이력서 detail 이력서 기본정보
	@Override
	public ResumeDto ResumeDetail(HashMap<String, Integer> map) {		
		return sqlSession.selectOne(namespace + "ResumeDetail", map);
	}
	
	// 이력서 detail 경력
	@Override
	public List<CareerDto> CareerDetail(int rsmseq) {		
		return sqlSession.selectList(namespace + "CareerDetail", rsmseq);
	}
	
	// 이력서 detail 학력
	@Override
	public List<EducationDto> educationDetail(int rsmseq) {
		return sqlSession.selectList(namespace + "educationDetail", rsmseq);
	}
	
	// 이력서 detail 수상 및 기타
	@Override
	public List<AwardsEtcDto> AwardsEtcDetail(int rsmseq) {
		return sqlSession.selectList(namespace + "AwardsEtcDetail", rsmseq);
	}
	
	// 이력서 detail 외국어
	@Override
	public List<LanguageDto> LanguageDetail(int rsmseq) {
		return sqlSession.selectList(namespace + "LanguageDetail", rsmseq);
	}
	
	// 이력서 detail 링크
	@Override
	public List<LinkDto> LinkDetail(int rsmseq) {
		return sqlSession.selectList(namespace + "LinkDetail", rsmseq);
	}
	
	// 이력서 delete 경력
	@Override
	public int careerDelete(int seq) {
		return sqlSession.delete(namespace + "careerDelete", seq);
	}
	
	// 이력서 delete 학력
	@Override
	public int educationDelete(int seq) {
		return sqlSession.delete(namespace + "educationDelete", seq);
	}
	
	// 이력서 delete 수상 및 기타
	@Override
	public int awardsEtcDelete(int seq) {
		return sqlSession.delete(namespace + "AwardsEtcDelete", seq);
	}
	
	// 이력서 delete 외국어
	@Override
	public int languageDelete(int seq) {
		return sqlSession.delete(namespace + "LanguageDelete", seq);
	}
	
	// 이력서 delete 링크
	@Override
	public int linkDelete(int seq) {
		return sqlSession.delete(namespace + "LinkDelete", seq);
	}
	
	// 이력서 delete 파일
	@Override
	public int fileDelete(int rsmSeq) {
		return sqlSession.delete(namespace + "fileDelete", rsmSeq);
	}
	
	// 이력서 update 기본 이력서
	@Override
	public int resumeUpdate(ResumeDto dto) {
		return sqlSession.update(namespace + "resumeUpdate", dto);
	}
	
	// 이력서 update 경력
	@Override
	public int careerUpdate(CareerDto dto) {
		return sqlSession.insert(namespace + "careerUpdate", dto);
	}
	
	// 이력서 update 학력
	@Override
	public int educationUpdate(EducationDto dto) {
		return sqlSession.insert(namespace + "educationUpdate", dto);
	}
	
	// 이력서 update 수상 및 기타
	@Override
	public int AwardsEtcUpdate(AwardsEtcDto dto) {
		return sqlSession.insert(namespace + "AwardsEtcUpdate", dto);
	}
	
	// 이력서 update 외국어
	@Override
	public int LanguageUpdate(LanguageDto dto) {
		return sqlSession.insert(namespace + "LanguageUpdate", dto);
	}
	
	// 이력서 update 링크
	@Override
	public int LinkUpdate(LinkDto dto) {
		return sqlSession.insert(namespace + "LinkUpdate", dto);
	}
	
	// 경력 전체 삭제
	@Override
	public int careerDeleteAll(int rsmseq) {
		return sqlSession.delete(namespace + "careerDeleteAll", rsmseq);
	}
	
	// 학력 전체 삭제
	@Override
	public int educationDeleteAll(int rsmseq) {
		return sqlSession.delete(namespace + "educationDeleteAll", rsmseq);
	}
	
	// 수상 및 기타 전체 삭제
	@Override
	public int awardsEtcDeleteAll(int rsmseq) {
		return sqlSession.delete(namespace + "AwardsEtcDeleteAll", rsmseq);
	}
	
	// 외국어 전체 삭제
	@Override
	public int languageDeleteAll(int rsmseq) {
		return sqlSession.delete(namespace + "LanguageDeleteAll", rsmseq);
	}
	
	// 링크 전체 삭제
	@Override
	public int linkDeleteAll(int rsmseq) {
		return sqlSession.delete(namespace + "LinkDeleteAll", rsmseq);
	}

	

	
	
	

	

	
	
	
	
	
	

}
