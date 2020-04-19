package pickme.com.a.customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FilesDto;
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

	// 디테일 가져오기 + 조회수 증가 
	@Override
	public NoticeDto getNoticeDetail(int seq) {
		sqlSession.update(namespace + "updateReadcount", seq);
		return sqlSession.selectOne(namespace + "getNoticeDetail", seq);
	}

	@Override
	public int countAllContent() {
		return sqlSession.selectOne(namespace + "countAllContent");
	}

	@Override
	public List<FilesDto> getNoticeFiles(int ref) {
		return sqlSession.selectList(namespace + "getNoticeFiles", ref);
	}

	
	
	
}
