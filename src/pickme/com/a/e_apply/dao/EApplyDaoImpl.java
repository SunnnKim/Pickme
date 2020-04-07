package pickme.com.a.e_apply.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MessageDto;

@Repository
public class EApplyDaoImpl implements EApplyDao{

	@Autowired
	SqlSession sqlSession;
	
	

}
