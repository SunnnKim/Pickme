package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MessageDto;
import model.MessageParam;
import pickme.com.a.c_apply.dao.CMsgDao;

@Service
public class CMsgServiceImpl implements CMsgService{
	
	@Autowired
	CMsgDao cMsgDao;
	
	@Override
	public List<MessageDto> rcvMsgList(MessageParam param) {
		return cMsgDao.rcvMsgList(param);
	}

	@Override
	public int getTotalMsgCount(MessageParam param) {
		return cMsgDao.getTotalMsgCount(param);
	}

	@Override
	public int unreadCount(int c_seq) {
		return cMsgDao.unreadCount(c_seq);
	}

	@Override
	public MessageDto rcvMsgDetail(int msgSeq) {
		return cMsgDao.rcvMsgDetail(msgSeq); 
	}

	@Override
	public List<MessageDto> getUnreadMsgCount(MessageParam param) {
		return cMsgDao.getUnreadMsgCount(param);
	}

	@Override
	public int msgOpen(int msgSeq) {
		return cMsgDao.msgOpen(msgSeq);
	}

	@Override
	public int deleteMsg(String checkRow) {
		String seqs[] = checkRow.split(",");
		
		int count = 0;
		for(int i =0; i < seqs.length; i++) {
			count += cMsgDao.deleteMsg(seqs[i]);
		}
		return count;
	}

	@Override
	public int sendMsg(MessageDto dto) {
		return cMsgDao.sendMsg(dto);
	}

	@Override
	public int addStar(int seq) {
		return cMsgDao.addStar(seq);
	}

	@Override
	public int removeStar(int seq) {
		return cMsgDao.removeStar(seq);
	}

	@Override
	public List<MessageDto> getImpoMsgList(MessageParam param) {
		return cMsgDao.getImpoMsgList(param);
	}

	@Override
	public int getImpoCount(MessageParam param) {
		return cMsgDao.getImpoCount(param);
	}

	@Override
	public int impoUnreadCount(int c_seq) {
		return cMsgDao.impoUnreadCount(c_seq);
	}

	@Override
	public List<MessageDto> getImpoUnreadMsgCount(MessageParam param) {
		return cMsgDao.getImpoUnreadMsgCount(param);
	}

	@Override
	public List<MessageDto> getSendMsgList(MessageParam param) {
		return cMsgDao.getSendMsgList(param);
	}

	@Override
	public int getSendMsgCount(MessageParam param) {
		return cMsgDao.getSendMsgCount(param);
	}

	@Override
	public MessageDto sendMsgDetail(int msgSeq) {
		return cMsgDao.sendMsgDetail(msgSeq);
	}
	

	@Override
	public int writeMsg(MessageDto dto) {
		return cMsgDao.writeMsg(dto);
	}

	@Override
	public String getEmail(int to) {
		return cMsgDao.getEmail(to);
	}

	@Override
	public int getLastSeq() {
		return cMsgDao.getLastSeq();
	}
	
	
}
