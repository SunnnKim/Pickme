package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MessageDto;
import model.MessageParam;

@Repository
public class CMsgDaoImpl implements CMsgDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "CMsg.";
	

	
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
	public MessageDto rcvMsgDetail(int msgSeq) {
		return sqlSession.selectOne(ns + "rcvMsgDetail" , msgSeq);
	}

	@Override
	public int msgOpen(int msgSeq) {
		return sqlSession.update(ns + "msgOpen", msgSeq); 
	}

	@Override
	public int deleteMsg(String seq) {
		return sqlSession.update(ns + "deleteMsg", seq);
	}

	@Override
	public List<MessageDto> getUnreadMsgCount(MessageParam param) {
		return sqlSession.selectList(ns + "getUnreadMsgCount", param);
	}

	@Override
	public int sendMsg(MessageDto dto) {
		return sqlSession.insert(ns + "sendMsg", dto);
	}

	@Override
	public int addStar(int seq) {
		return sqlSession.update(ns + "addStar", seq);
	}

	@Override
	public int removeStar(int seq) {
		return sqlSession.update(ns + "removeStar", seq);
	}

	@Override
	public List<MessageDto> getImpoMsgList(MessageParam param) {
		return sqlSession.selectList(ns + "getImpoMsgList", param);
	}

	@Override
	public int getImpoCount(MessageParam param) {
		return sqlSession.selectOne(ns + "getImpoCount", param);
	}

	@Override
	public int impoUnreadCount(int c_seq) {
		return sqlSession.selectOne(ns + "impoUnreadCount", c_seq);
	}

	@Override
	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param) {
		return sqlSession.selectList(ns + "getImpoUnreadMsgCount", param);
	}

	@Override
	public List<MessageDto> getSendMsgList(MessageParam param) {
		return sqlSession.selectList(ns + "getSendMsgList", param);
	}

	@Override
	public int getSendMsgCount(MessageParam param) {
		return sqlSession.selectOne(ns + "getSendCount", param);
	}

	@Override
	public MessageDto sendMsgDetail(int msgSeq) {
		return sqlSession.selectOne(ns + "sendMsgDetail", msgSeq);
	}
	

	@Override
	public int writeMsg(MessageDto dto) {
		return sqlSession.insert(ns + "writeMsg", dto);
	}

	@Override
	public String getEmail(int to) {
		return sqlSession.selectOne(ns + "getEmail", to); 
	}

	@Override
	public int getLastSeq() {
		return sqlSession.selectOne(ns + "getLastSeq");
	}
	
}
