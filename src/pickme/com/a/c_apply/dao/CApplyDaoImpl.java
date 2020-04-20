package pickme.com.a.c_apply.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CApplyDaoImpl implements CApplyDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "CApply.";
}
