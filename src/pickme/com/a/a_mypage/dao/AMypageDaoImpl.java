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
	
	
	@Override
	public boolean profileUpdate(AMemberDto dto) {
		return sqlSession.update(ns + "profileUpdate", dto) > 0 ? true : false;
	}
	
	
	
	// 프로필
	

}
