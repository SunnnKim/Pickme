package pickme.com.a.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberDto;


@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";

	@Override
	public MemberDto test() {
		return sqlSession.selectOne(namespace + "test");
	}
	
	
	
}
