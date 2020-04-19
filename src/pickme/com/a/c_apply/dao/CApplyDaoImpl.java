package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageDto;
import model.MessageParam;


@Repository
public class CApplyDaoImpl implements CApplyDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "CApply.";
	
	@Override
	public List<CvRequestDto> getRequestList(int c_seq) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "getRequestList", c_seq);
		return list;
	}
	
	@Override
	public List<CvRequestDto> getRequestList(MessageParam param) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "getRequestList", param);
		return list;
	}
	
	@Override
	public int requestDelete(String seq) {
		System.out.println("seq : " + seq);
		return sqlSession.update(ns+"requestDelete", seq);		
	}
	
	@Override
	public List<CvRequestDto> requestLike(int c_seq) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "requestLike", c_seq);
		return list;
	}
	
	@Override
	public List<CvRequestDto> requestLike(MessageParam param) {
		List<CvRequestDto> list = sqlSession.selectList(ns + "requestLike", param);
		return list;
	}

	@Override
	public boolean addLike(FavoriteDto dto) {
		int n = sqlSession.insert(ns + "addLike", dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean delLike(FavoriteDto dto) {
		int n = sqlSession.delete(ns + "delLike", dto);
		return n>0?true:false;
	}

	@Override
	public int requestCancel(String cv_seq) {
		return sqlSession.update(ns + "requestCancel", cv_seq);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		int totalRecordCount = sqlSession.selectOne(ns + "getTotalRecordCount",param);
		return totalRecordCount;
	}
	
	@Override
	public int getLikeTotalRecordCount(MessageParam param) {
		int totalRecordCount = sqlSession.selectOne(ns + "getLikeTotalRecordCount",param);
		return totalRecordCount;
	}

	
	
	
	
	
	
	
	
	
	
	@Override
	public List<MessageDto> rcvMsgList(MessageParam param) {
		List<MessageDto> list = sqlSession.selectList(ns + "rcvMsgList", param);
		return list;
	}

	@Override
	public int getTotalMsgCount(MessageParam param) {
		int totalMsgCount = sqlSession.selectOne(ns + "getTotalMsgCount",param);
		return totalMsgCount;
	}

	@Override
	public int unreadCount(int c_seq) {
		int unreadCount = sqlSession.selectOne(ns + "unreadCount", c_seq);
		return unreadCount;
	}

	@Override
	public MessageDto rMsgDetail(int msgSeq) {
		return sqlSession.selectOne(ns + "rMsgDetail" , msgSeq);
	}

	
}
