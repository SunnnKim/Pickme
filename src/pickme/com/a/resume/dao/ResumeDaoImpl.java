package pickme.com.a.resume.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;

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
	

	
	
	
	
	

}
