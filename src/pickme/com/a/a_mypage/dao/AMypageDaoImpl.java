package pickme.com.a.a_mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AMemberDto;

@Repository
public class AMypageDaoImpl implements AMypageDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "Amember.";
	
	// 프로필 정보 보여주기
	@Override
	public AMemberDto profileSelect(int seq) {		
		return sqlSession.selectOne(ns + "profileSelect", seq);		
	}	
	
	// 프로필 업로드
	@Override
	public boolean profileUpdate(AMemberDto dto) {
		return sqlSession.update(ns + "profileUpdate", dto) > 0 ? true : false;
	}

	
	
	
	
	
	

}
