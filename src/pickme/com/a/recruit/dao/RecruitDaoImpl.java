package pickme.com.a.recruit.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "Recruit.";

	@Override
	public int getRef() {
		return sqlSession.selectOne(ns+"rec_getRef");
	}
	
	
}
