package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FilesDto;
import model.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sqlSession;
	String namespace = "Notice.";
	
	@Override
	public int insertNotice(NoticeDto dto) {
		// 공시사항 등록하기 
		sqlSession.insert(namespace + "insertNotice", dto);
		// 등록한 공지사항의 시퀀스 번호 불러오기 
		int seq = sqlSession.selectOne(namespace + "getLastSeq");
		return seq;
	}

	@Override
	public boolean insertFiles(List<FilesDto> list) {
		// 등록한 첨부파일목록을 디비에 넣기 
		for( int i = 0; i < list.size(); i++) {
			FilesDto file = list.get(i);
			int result = sqlSession.insert(namespace + "insertFiles", file);
			if(result == 0) {
				return false;
			}
		}
		return true;
	}

	@Override
	public List<NoticeDto> getAllNotice() {
		return sqlSession.selectList(namespace + "getAllNotice");
	}
	
	
	
}
