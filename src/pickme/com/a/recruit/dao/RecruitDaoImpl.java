package pickme.com.a.recruit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FilesDto;
import model.RecruitDto;

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

	/*
	@Override
	public int insertRecruit(RecruitDto dto) {
		//채용등록 등록
		sqlSession.insert(ns + "recInsert", dto);
		//등록한 채용등록테이블 seq 불러오기
		int seq = sqlSession.selectOne(ns + "getLastSeq");
		return seq;
	}/**/
	
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

}
