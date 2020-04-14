package pickme.com.a.customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.NoticeDto;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSession sqlSession;
	String namespace = "Notice.";

	@Override
	public List<NoticeDto> getAllNoticePage(int pageNumber) {
		pageNumber = pageNumber * 10;
		return sqlSession.selectList(namespace + "getAllNoticePaging", pageNumber);
	}

	@Override
	public NoticeDto getNoticeDetail(int seq) {
		return sqlSession.selectOne(namespace + "getNoticeDetail", seq);
	}

	@Override
	public int countAllContent() {
		return sqlSession.selectOne(namespace + "countAllContent");
	}
	
	
	
}
