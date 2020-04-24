package pickme.com.a.e_apply.controller;

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

import model.AMemberDto;
import model.MessageDto;
import model.MessageParam;
import pickme.com.a.e_apply.service.EMessageService;

@Controller
@RequestMapping(value="/e_apply")
public class EMessageController {
	
	@Autowired
	EMessageService eservice;
	
	// 받은 메시지 페이지 불러오기
	@RequestMapping(value="inMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getInMsgList(Model model, HttpSession session, MessageParam param) {
	
	
		// session에서 login seq 받아오기 
		int toSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		
		System.out.println("로그인아이디: " + toSeq);
		
		// 받은 사람 seq 를 수신인 seq로 셋팅 
		param.setToSeq(toSeq);
		System.out.println("param.getToSeq: " + param.getToSeq());
		
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
	
		// MessageParam에 셋팅 
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> msg = (List<MessageDto>)eservice.getInMsgList(param); 
		System.out.println("messageListSize:: " + msg.size());
		
		// 총 메시지 갯수

		int totalRecordCount = eservice.getTotalRecordCount(param);
		System.out.println("totalRecordCount:: " + totalRecordCount);
		
		
		// 읽지 않은 받은 메시지 수
		int unreadCount = unreadCount(toSeq);
		System.out.println("unreadCount: " + unreadCount);
		
		
		model.addAttribute("unreadCount", unreadCount);
		model.addAttribute("inMsglist", msg);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		
		System.out.println("keyword : " + param.getsKeyword());
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/inMsg";
	}
	
	
	// 중요메시지 표시
	@ResponseBody
	@RequestMapping(value="addStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int addStar(int seq) {
	//	System.out.println("seq: " + seq);
		
		int n = eservice.addStar(seq);
	//	System.out.println("result: " + n);
		
		return n;
	}
	
	// 중요메시지 표시 취소
	@ResponseBody
	@RequestMapping(value="removeStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int removeStar(int seq) {
	//	System.out.println("seq: " + seq);
		
		int n = eservice.removeStar(seq);
	//	System.out.println("result: " + n);
				
		return n;
	}
	
	
	// 메시지 디테일 페이지 
	@RequestMapping(value="seeMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getMsgDetail(Model model, HttpSession session, int seq, String page, int unread, int pageNumber) {
		
	//	System.out.println("unread: " );	
	//	System.out.println("seq: " + seq);
	//	System.out.println("page: " + page);
		
		MessageDto msg = null;
		
		if(page.equals("outMsg")) {
			// 보낸 메시지 중에서 메시지 디테일 불러오기(기업명이 다른테이블에 있어서 나눠서 불러와야함)
			msg = eservice.getSMsgDetail(seq);
			
		}else {
			// 받은 메시지 중에서 메시지 디테일 불러오기
			int n = eservice.msgOpen(seq);
			msg = eservice.getMsgDetail(seq);
		}
		// System.out.println(msg.toString());
		
		model.addAttribute("unread" , unread);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("page", page);
		model.addAttribute("msgDetail", msg);
	
		return "e_apply/seeMsg";
	}
	
	
	// 보낸메시지 페이지 불러오기
	@RequestMapping(value="outMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getOutMsgList(Model model,  HttpSession session, MessageParam param){
		
		System.out.println("keyword" + param.getsKeyword());
		
		// session에서 login seq 받아오기 
		int toSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		
		// 받은 사람(원래는 보낸사람 seq로 해야하는데 param에 toSeq밖에 없어 그냥 통용하기)seq 를 수신인 seq로 셋팅 
		param.setToSeq(toSeq);
		
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> msg = (List<MessageDto>)eservice.getOutMsgList(param); 
		System.out.println("messageListSize:" + msg.size());
		
	//	System.out.println(msg.get(0).toString());
		
		int totalRecordCount = eservice.getSendMsgCount(param);
		
		
		model.addAttribute("outMsglist", msg);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		
		System.out.println("skeword: " + param.getsKeyword());
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "e_apply/outMsg";
	}
	
	@RequestMapping(value="impoMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getImpoMsgList(Model model, HttpSession session, MessageParam param) {
		
		// session에서 login seq 받아오기 
		int toSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		
		
		param.setToSeq(toSeq);
		
		
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> impoMsgList = eservice.getImpoMsgList(param);
		System.out.println("messageListSize:" + impoMsgList.size());
		
		// System.out.println(impoMsgList.get(0).toString());
		
		
		int ImpoCount = eservice.getImpoCount(param);
		
		System.out.println("totalRecordCount:: " + ImpoCount);
		
		
		// 읽지 않은 중요 메시지 수
		int impoUnreadCount = impoUnreadCount(toSeq);
		System.out.println("unreadCount: " + impoUnreadCount);
				
		model.addAttribute("unreadCount", impoUnreadCount);
		model.addAttribute("impoMsglist", impoMsgList);
		model.addAttribute("totalRecordCount", ImpoCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "e_apply/impoMsg";
	}
	
	
	// 메시지 지우기
	@ResponseBody
	@RequestMapping(value="deleteMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public int[] deleteMsg(int[] seqArray) {
		System.out.println("seqArray" + seqArray.length);
		
		int[] result = eservice.deleteMsg(seqArray);
		
		for (int i = 0; i < result.length; i++) {
			System.out.println(i + "번: " + result[i]);
		}
		
		
		return result;
	}
	
	// 메시지 보내기
	@ResponseBody
	@RequestMapping(value="sendMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, String> sendMsg(MessageDto dto, HttpSession session) {
		
		AMemberDto loginuser = (AMemberDto) session.getAttribute("loginuser");
		// session에서 login seq 받아오기 
		int fromSeq = loginuser.getSeq();
	
		// 보내는 이의 이름 가져오기
		String senderName = loginuser.getName();
		System.out.println("senderName: " + senderName);
		
		System.out.println(dto.toString());
		
		dto.setFrom(fromSeq);
		
		// 보낸메시지 데이터 테이블에 삽입 
		int result = eservice.sendMsg(dto);
	    
		// 받는 이의 이메일 불러오기 
		String receiverEmail = eservice.getEmail(dto.getTo());
	    System.out.println("receiverEmail: " + receiverEmail);
		// 보낸 메시지 seq 불러오기
		int seq = eservice.getLastId();
		// String타입으로 파싱 
		String msgSeq = seq + "";
		
		Map<String, String> map = new HashMap<>();
		
		map.put("receiverEmail", receiverEmail);
		map.put("senderName", senderName);
		map.put("msgSeq", msgSeq);
		
	
		return map;
	}
	
	public int unreadCount(int seq) {
		
		int n = eservice.unreadCount(seq);
		return n;
	}
	
	public int impoUnreadCount(int seq) {
		
		int n = eservice.impoUnreadCount(seq);
		return n;
	}
	
	@RequestMapping(value="unread.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String getUnreadMsg(Model model, MessageParam param, HttpSession session, String page) { 
		System.out.println("page: " + page);
		
		
		int toSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		
		System.out.println("로그인아이디: " + toSeq);
		
		// 받은 사람 seq 를 수신인 seq로 셋팅 
		param.setToSeq(toSeq);
		System.out.println("param.getToSeq: " + param.getToSeq());
		
		 int pn = param.getPageNumber(); // 현재페이지넘버
			int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
			int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
			
			System.out.println("pn: " + pn + " start: " + start + " end: " +end);
			
			param.setStart(start);
			param.setEnd(end);
		
		if(page.equals("inMsg")){
			System.out.println("inMsg");
			
			// 받은메시지 중 안읽은 메시지 리스트 불러오기
			List<MessageDto> msg = (List<MessageDto>)eservice.getUnreadMsgCount(param); 
			System.out.println("messageListSize:: " + msg.size());
			
			int totalRecordCount = unreadCount(toSeq);
			
			System.out.println("totalRecordUnread : " + totalRecordCount);
			
			model.addAttribute("isUnread", "yes");
			model.addAttribute("inMsglist", msg);
			model.addAttribute("unreadCount", totalRecordCount);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("pageNumber", pn);
			model.addAttribute("sKeyword", param.getsKeyword());
			
			return "e_apply/inMsg";
			
		}else{
			System.out.println("중요메시지로");
			
			// 중요메시지 중 안읽은 메시지 리스트 불러오기
			List<MessageDto> msg = (List<MessageDto>)eservice.getImpoUnreadMsgCount(param); 
			System.out.println("messageListSize:: " + msg.size());
			
			
			int totalRecordCount = impoUnreadCount(toSeq);
			
			model.addAttribute("isUnread", "yes");
			model.addAttribute("impoMsglist", msg);
			model.addAttribute("unreadCount", totalRecordCount);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("pageNumber", pn);
			model.addAttribute("sKeyword", param.getsKeyword());
			
			return "e_apply/impoMsg";
		}	
		
	}
	
	@RequestMapping(value="sendMsgPgOpen.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String sendMsgPgOpen () {
		
		
		return "include/sendMsg.jsp";
	}
	
}

















