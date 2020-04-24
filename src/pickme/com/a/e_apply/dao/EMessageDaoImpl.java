package pickme.com.a.e_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MessageDto;
import model.MessageParam;

@Repository
public class EMessageDaoImpl implements EMessageDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "eApplyMessage.";
	
	@Override
	public List<MessageDto> getInMsgList(MessageParam param) {
		
		List<MessageDto> msg =  sqlSession.selectList(ns + "getInMsgList", param);
		
		return msg;
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		
		int totalRecordCount = sqlSession.selectOne(ns + "getTotalRecordCount",param);
	
		System.out.println("totalRecordCount:::--" + totalRecordCount);
		return totalRecordCount;
	
	}

	@Override
	public int addStar(int seq) {
		
		return sqlSession.update(ns + "addStar", seq);
	}

	@Override
	public MessageDto getMsgDetail(int seq) {
		
		return sqlSession.selectOne(ns + "getMsgDetail" , seq);
	}
	

	@Override
	public MessageDto getSMsgDetail(int seq) {
		
		return sqlSession.selectOne(ns + "getSMsgDetail", seq);
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
	public int removeStar(int seq) {
		
		return sqlSession.update(ns + "removeStar" , seq);
	}

	@Override
	public int[] deleteMsg(int[] seqArray) {
		
		int seq = 0;
		int[]result = new int[seqArray.length]; 
		for (int i = 0; i < seqArray.length; i++) {
			
			seq = seqArray[i];
					
			result[i]=sqlSession.delete(ns + "deleteMsg", seq);
			
		}
		
		return result;
	}

	@Override
	public List<MessageDto> getOutMsgList(MessageParam param) {
		
		List<MessageDto> msg =  sqlSession.selectList(ns + "getOutMsgList", param);
		
		return msg;
	}

	@Override
	public int getSendMsgCount(MessageParam param) {
		
		return sqlSession.selectOne(ns + "getSendCount", param);
	}

	@Override
	public int msgOpen(int seq) {
		
		return sqlSession.update(ns + "msgOpen", seq);
	}

	@Override
	public int sendMsg(MessageDto dto) {
		
		return sqlSession.insert(ns + "sendMsg" ,  dto);
	}
	
	@Override
	public int getLastId() {
		
		return sqlSession.selectOne(ns + "getLastId");
	}

	@Override
	public String getEmail(int to) {
		
		return sqlSession.selectOne(ns + "getEmail", to);
	}

	@Override
	public int unreadCount(int seq) {
		
		return sqlSession.selectOne(ns + "unreadCount", seq);
	}

	@Override
	public int impoUnreadCount(int seq) {
		
		return sqlSession.selectOne(ns + "impoUnreadCount", seq);
	}

	@Override
	public List<MessageDto> getUnreadMsgCount(MessageParam param) {
		
		return sqlSession.selectList(ns + "getUnreadMsgCount", param);
	}

	@Override
	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param) {
		
		return sqlSession.selectList(ns + "getImpoUnreadMsgCount", param);
	}
		
	
}
