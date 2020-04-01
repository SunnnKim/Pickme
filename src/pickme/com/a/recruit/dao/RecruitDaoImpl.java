package pickme.com.a.recruit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.RequestDto;

@Repository
public class RecruitDaoImpl implements RecruitDao{

	@Autowired
	SqlSession sqlSession;
	String namespace = "Request.";

	@Override
	public List<RequestDto> getRequestList() {
		List<RequestDto> list = sqlSession.selectList(namespace+"getRequestList");
		return list;
	}
	
	
}
