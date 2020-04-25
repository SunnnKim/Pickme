package pickme.com.a.c_apply.dao;

import java.util.List;

import model.MessageDto;
import model.MessageParam;

public interface CMsgDao {

	
	public List<MessageDto> rcvMsgList(MessageParam param);

	public int getTotalMsgCount(MessageParam param);

	public int unreadCount(int c_seq);

	public MessageDto rcvMsgDetail(int msgSeq);

	public int msgOpen(int msgSeq);

	public int deleteMsg(String seq);

	public List<MessageDto> getUnreadMsgCount(MessageParam param);

	public int sendMsg(MessageDto dto);

	public int addStar(int seq);

	public int removeStar(int seq);

	public List<MessageDto> getImpoMsgList(MessageParam param);

	public int getImpoCount(MessageParam param);

	public int impoUnreadCount(int c_seq);

	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param);

	public List<MessageDto> getSendMsgList(MessageParam param);

	public int getSendMsgCount(MessageParam param);

	public MessageDto sendMsgDetail(int msgSeq);
	
	

	public int writeMsg(MessageDto dto);

	public String getEmail(int to);

	public int getLastSeq();
}
