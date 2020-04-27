package pickme.com.a.c_apply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.CMemberDto;
import model.MessageDto;
import model.MessageParam;
import pickme.com.a.c_apply.service.CMsgService;

@Controller
@RequestMapping(value = "/c_apply")
public class CMsgController {

	@Autowired
	CMsgService cMsgService;
	
	/*============== 받은 메시지함 호출 ==============*/
	@RequestMapping(value = "cRcvMsg.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cRcvMsg(Model model, HttpSession session, MessageParam param) {
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq(); 
		param.setToSeq(c_seq);
		//System.out.println(">>>>> cRcvMsg.do < c_seq > : " + c_seq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		//System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		param.setStart(start);
		param.setEnd(end);
		System.out.println(">>>>> cRcvMsg.do < param > : " + param.toString());
		
		
		List<MessageDto> list = cMsgService.rcvMsgList(param);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(i +" : " + list.get(i));
		}
		
		
		int totalMsgCount = cMsgService.getTotalMsgCount(param);
		System.out.println(">>>>> totalRecordCount:: " + totalMsgCount);

		int unreadCount = cMsgService.unreadCount(c_seq);
		System.out.println(">>>>> unreadCount:: " + unreadCount);
		
		
		model.addAttribute("unreadCount", unreadCount);
		
		model.addAttribute("totalMsgCount", totalMsgCount);
		model.addAttribute("pageNumber", pn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sKeyword", param.getsKeyword());
	    
	    model.addAttribute("rcvMsgList", list);
		return "c_apply/cRcvMsg";
	}

	
	
	@RequestMapping(value="msgDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String msgDetail(Model model, HttpSession session, int msgSeq, String page, int unread, int pageNumber) {
		System.out.println("msgDetail.do < msgSeq >: " + msgSeq);

		MessageDto msg = null;
		
		if(page.equals("cSendMsg")) { 
			// 보낸 메시지 중에서 메시지 디테일 불러오기(기업명이 다른테이블에 있어서 나눠서 불러와야함)
			msg = cMsgService.sendMsgDetail(msgSeq); 
		} else {
			// 받은 메시지 중에서 메시지 디테일 불러오기
			int n = cMsgService.msgOpen(msgSeq);
			System.out.println("msgOpen success value : " + n);
			
			msg = cMsgService.rcvMsgDetail(msgSeq); 
		}
		 
		model.addAttribute("unread", unread);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("page", page);
		model.addAttribute("msgDetail", msg);
		
		
		
		return "c_apply/detailMsg";
	}
	
	
	
	
	/*============== 안읽은 메시지 ==============*/
	@RequestMapping(value="unread.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String getUnreadMsg(Model model, MessageParam param, HttpSession session, String page) { 
		System.out.println("page: " + page);
		
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		System.out.println("unread.do <c_seq> : " + c_seq);
		
		// 받은 사람 seq 를 수신인 seq로 셋팅 
		param.setToSeq(c_seq);
		System.out.println("param.getToSeq : " + param.getToSeq());
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		param.setStart(start);
		param.setEnd(end);
		
		if(page.equals("cRcvMsg")){
			System.out.println("cRcvMsg call");
			
			// 받은메시지 중 안읽은 메시지 리스트 불러오기
			List<MessageDto> list = cMsgService.getUnreadMsgCount(param); 
			System.out.println("messageListSize:: " + list.size());
			
			int totalRecordCount = cMsgService.unreadCount(c_seq);
			System.out.println("totalRecordUnread : " + totalRecordCount);
			
			model.addAttribute("isUnread", "yes");
			model.addAttribute("rcvMsgList", list);
			model.addAttribute("unreadCount", totalRecordCount);
			model.addAttribute("totalMsgCount", totalRecordCount);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("pageNumber", pn);
			model.addAttribute("sKeyword", param.getsKeyword());
			
			return "c_apply/cRcvMsg";
			
		} else {
			System.out.println("중요메시지로");
			
			  // 중요메시지 중 안읽은 메시지 리스트 불러오기 
			List<MessageDto> msg = cMsgService.getImpoUnreadMsgCount(param);
		    System.out.println("messageListSize:: " + msg.size());
		  
		  
		    int totalRecordCount = cMsgService.impoUnreadCount(c_seq);
		  
		    model.addAttribute("isUnread", "yes"); 
		    model.addAttribute("impoMsglist", msg); 
		    model.addAttribute("unreadCount", totalRecordCount);
		    model.addAttribute("totalRecordCount", totalRecordCount);
		    model.addAttribute("pageCountPerScreen", 10);
		    model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		    model.addAttribute("pageNumber", pn); model.addAttribute("sKeyword", param.getsKeyword());
			 
			return "c_apply/cImpoMsg";
		}	
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="cImpoMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getImpoMsgList(Model model, HttpSession session, MessageParam param) {
		
		// session에서 login seq 받아오기 
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		
		
		param.setToSeq(c_seq);
		
		System.out.println("c_seq : " + c_seq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> impoMsgList = cMsgService.getImpoMsgList(param);
		System.out.println(">>>>>>>>>>>>>> impoMsgList size : " + impoMsgList.size());
		
		// System.out.println(impoMsgList.get(0).toString());
		
		
		int ImpoCount = cMsgService.getImpoCount(param);
		
		System.out.println("totalRecordCount:: " + ImpoCount);
		
		
		// 읽지 않은 중요 메시지 수
		int impoUnreadCount = cMsgService.impoUnreadCount(c_seq);
		System.out.println("unreadCount: " + impoUnreadCount);
				
		model.addAttribute("unreadCount", impoUnreadCount);
		model.addAttribute("impoMsglist", impoMsgList);
		model.addAttribute("totalRecordCount", ImpoCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "c_apply/cImpoMsg";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 중요메시지 표시
	@ResponseBody
	@RequestMapping(value="addStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int addStar(int seq) {
	//	System.out.println("seq: " + seq);
		
		int n = cMsgService.addStar(seq);
	//	System.out.println("result: " + n);
		
		return n;
	}
	
	// 중요메시지 표시 취소
	@ResponseBody
	@RequestMapping(value="removeStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int removeStar(int seq) {
	//	System.out.println("seq: " + seq);
		
		int n = cMsgService.removeStar(seq);
	//	System.out.println("result: " + n);
				
		return n;
	}
	
	
	
	// 메시지 지우기
	@ResponseBody
	@RequestMapping(value="deleteMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public int deleteMsg(String checkRow) {
		System.out.println("checkRow : " + checkRow);
		
		int count = cMsgService.deleteMsg(checkRow);
		
		return count;
	}
	
	
	
	// 메시지 보내기
	@ResponseBody
	@RequestMapping(value="sendMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int sendMsg(MessageDto dto, HttpSession session) {
		
		// session에서 login seq 받아오기 
		int fromSeq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		
		System.out.println(dto.toString());
		
		// 나중에 login Session에서 받아서 seq 넣어주기
		dto.setFrom(fromSeq);
		
		int result = cMsgService.sendMsg(dto);
		
	
		return result;
	}
	
	
	
	
	
	
	
	

	@ResponseBody
	@RequestMapping(value = "writeMsg.do", method = { RequestMethod.POST })
	public Map<String, String> writeMsg(MessageDto dto, HttpSession session) {
	
		// session에서 login seq 받아오기 
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		// 보내는 이의 이름 가져오기
		String senderName = ((CMemberDto)session.getAttribute("logincompany")).getName();
				
		System.out.println("senderName: " + senderName);
		
		dto.setFrom(c_seq);
		System.out.println(dto.toString());
		
		
		// 보낸메시지 데이터 테이블에 삽입 
		int result = cMsgService.writeMsg(dto);
	    System.out.println(result);
		// 받는 이의 이메일 불러오기 
		String receiverEmail = cMsgService.getEmail(dto.getTo());
	    System.out.println("receiverEmail: " + receiverEmail);
		// 보낸 메시지 seq 불러오기
		int seq = cMsgService.getLastSeq();
		// String타입으로 파싱 
		String msgSeq = seq + "";
		
		Map<String, String> map = new HashMap<>();
		
		map.put("receiverEmail", receiverEmail);
		map.put("senderName", senderName);
		map.put("msgSeq", msgSeq);
		
	
		return map;
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	/*============== 보낸 메시지함 호출 ==============*/
	@RequestMapping(value = "cSendMsg.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cSendMsg(Model model, HttpSession session, MessageParam param) {
		// session에서 login seq 받아오기 
		int toSeq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		
		param.setToSeq(toSeq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> msg = cMsgService.getSendMsgList(param); 
		System.out.println("messageListSize:" + msg.size());
		
		
		
		int totalRecordCount = cMsgService.getSendMsgCount(param);
		System.out.println("totalRecordCount : " + totalRecordCount);
		
		
		
		model.addAttribute("sendMsglist", msg);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "c_apply/cSendMsg";
	}

	
	
	
	
	@ResponseBody
	@RequestMapping(value = "totalMsgCount.do", method= {RequestMethod.POST})
	public String totalMsgCount(HttpSession session) {
		System.out.println("totalMsgCount.do 실행");
		// 로그인 세션에서 seq 호출
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		System.out.println("로그인 아이디 : " + c_seq);
		
		MessageParam param = new MessageParam();
		param.setToSeq(c_seq);
		
		int totalMsgCount = cMsgService.unreadCount(c_seq);
		
		return totalMsgCount + "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
