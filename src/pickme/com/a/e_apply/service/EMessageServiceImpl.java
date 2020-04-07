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

	@Override
	public MessageDto getMsgDetail(int seq) {
		
		return dao.getMsgDetail(seq);
	}

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
	};

}
