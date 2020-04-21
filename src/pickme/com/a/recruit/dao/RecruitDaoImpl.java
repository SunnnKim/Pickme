package pickme.com.a.recruit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;

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
	public CMemberDto getAddr(int seq) {
		return sqlSession.selectOne(ns+"getAddr", seq);
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
	public void dayUpdateDel() {
		sqlSession.update(ns+"dayUpdateDel");
	}


	




}
