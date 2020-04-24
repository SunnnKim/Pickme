package pickme.com.a.e_apply.service;

import java.util.List;

import model.MessageDto;
import model.MessageParam;

public interface EMessageService {
	public List<MessageDto> getInMsgList(MessageParam param);
	
	
	public int getTotalRecordCount(MessageParam param);
	
	
	public int addStar(int seq);
	
	public MessageDto getMsgDetail(int seq);
	
	public MessageDto getSMsgDetail(int seq);
	
	public List<MessageDto> getImpoMsgList(MessageParam param);
	
	public int getImpoCount(MessageParam param);
	
	public int removeStar(int seq);
	
	public int[] deleteMsg(int seqArray[]);
	
	public List<MessageDto> getOutMsgList(MessageParam param);
	
	public int getSendMsgCount(MessageParam param);
	
	public int msgOpen(int seq);
	
	public int sendMsg(MessageDto dto);
	
	public int getLastId();
	
	public String getEmail(int to);
	
	public int unreadCount(int seq);
	
	public int impoUnreadCount(int seq);
	
	public List<MessageDto> getUnreadMsgCount(MessageParam param);
	
	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param);
	
	
}
