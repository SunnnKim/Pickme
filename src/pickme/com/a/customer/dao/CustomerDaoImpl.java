package pickme.com.a.customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FilesDto;
import model.NoticeDto;
import model.PremierServiceDto;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSession sqlSession;
	String Notice = "Notice.";
	String Payment = "Payment.";

	@Override
	public List<NoticeDto> getAllNoticePage(int pageNumber) {
		pageNumber = pageNumber * 10;
		return sqlSession.selectList(Notice + "getAllNoticePaging", pageNumber);
	}

	// 디테일 가져오기 + 조회수 증가 
	@Override
	public NoticeDto getNoticeDetail(int seq) {
		sqlSession.update(Notice + "updateReadcount", seq);
		return sqlSession.selectOne(Notice + "getNoticeDetail", seq);
	}

	@Override
	public int countAllContent() {
		return sqlSession.selectOne(Notice + "countAllContent");
	}

	@Override
	public List<FilesDto> getNoticeFiles(int ref) {
		return sqlSession.selectList(Notice + "getNoticeFiles", ref);
	}

	@Override
	public List<PremierServiceDto> getPremierService() {
		return sqlSession.selectList(Payment + "getPremierService");
	}

	@Override
	public PremierServiceDto getServiceDetail(int serviceSeq) {
		return sqlSession.selectOne(Payment + "getServiceDetail", serviceSeq);
	}

	
	
	
}
