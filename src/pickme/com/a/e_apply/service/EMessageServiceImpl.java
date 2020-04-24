package pickme.com.a.e_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MessageDto;
import model.MessageParam;
import pickme.com.a.e_apply.dao.EMessageDao;

@Service
public class EMessageServiceImpl implements EMessageService {
	
	@Autowired
	EMessageDao dao;
	
	public List<MessageDto> getInMsgList(MessageParam param) {
		return dao.getInMsgList(param);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		
		return dao.getTotalRecordCount(param);
	}

	@Override
	public int addStar(int seq) {
		
		return dao.addStar(seq);
	}

	// 받은 메시지 detail 
	@Override
	public MessageDto getMsgDetail(int seq) {
		
		return dao.getMsgDetail(seq);
	}
	
	// 보낸메시지 detail
	@Override
	public MessageDto getSMsgDetail(int seq) {
		
		return dao.getSMsgDetail(seq);
	};

	@Override
	public List<MessageDto> getImpoMsgList(MessageParam param) {
		
		return dao.getImpoMsgList(param);
	}

	@Override
	public int getImpoCount(MessageParam param) {
	
		return dao.getImpoCount(param);
	}

	@Override
	public int removeStar(int seq) {
	
		return dao.removeStar(seq);
	}

	@Override
	public int[] deleteMsg(int[] seqArray) {
		
		return dao.deleteMsg(seqArray);
	}

	@Override
	public List<MessageDto> getOutMsgList(MessageParam param) {
		
		return dao.getOutMsgList(param);
	}

	@Override
	public int getSendMsgCount(MessageParam param) {
		
		return dao.getSendMsgCount(param);
	}

	@Override
	public int msgOpen(int seq) {
		
		return dao.msgOpen(seq);
	}

	@Override
	public int sendMsg(MessageDto dto) {
		
		return dao.sendMsg(dto);
	}

	@Override
	public int unreadCount(int seq) {
		
		return dao.unreadCount(seq);
	}

	@Override
	public int impoUnreadCount(int seq) {
	
		return dao.impoUnreadCount(seq);
	}

	@Override
	public List<MessageDto> getUnreadMsgCount(MessageParam param) {
		
		return dao.getUnreadMsgCount(param);
	}

	@Override
	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param) {
		
		return dao.getImpoUnreadMsgCount(param);
	}


	@Override
	public int getLastId() {
		
		return dao.getLastId();
	}

	@Override
	public String getEmail(int to) {
	
		return dao.getEmail(to);
	}
	


}
