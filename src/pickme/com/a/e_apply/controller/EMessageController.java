package pickme.com.a.e_apply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.MessageDto;
import model.MessageParam;
import pickme.com.a.e_apply.service.EMessageService;

@Controller
@RequestMapping(value="/e_apply")
public class EMessageController {
	
	@Autowired
	EMessageService eservice;
	
	@RequestMapping(value="inMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getInMsgList(Model model, MessageParam param) {
		
		System.out.println("param: " + param.toString());
		
		// session에서 login seq 받아오기 
		// String to_seq = ((MemberDto) session.getAttribute("login")).getSeq();
		
		// 받은 사람 seq 를 수신인 seq로 셋팅 
		//param.setTo_seq(to_seq);
		
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MessageDto> msg = (List<MessageDto>)eservice.getInMsgList(param); 
		System.out.println("messageListSize:: " + msg.size());
		
		// System.out.println("msg확인: " + msg.get(0).toString());
		
		
		int totalRecordCount = eservice.getTotalRecordCount(param);
		
		System.out.println("totalRecordCount:: " + totalRecordCount);
		
		
		model.addAttribute("inMsglist", msg);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/inMsg";
	}
	
	@ResponseBody
	@RequestMapping(value="addStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int addStar(int seq) {
		
		System.out.println("seq: " + seq);
		
		int n = eservice.addStar(seq);
		System.out.println("result: " + n);
		
		return n;
	}
	
	@ResponseBody
	@RequestMapping(value="removeStar.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int removeStar(int seq) {
		
		System.out.println("seq: " + seq);
		
		int n = eservice.removeStar(seq);
		System.out.println("result: " + n);
				
		return n;
	}
	
	
	
	@RequestMapping(value="seeMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getMsgDetail(Model model, int seq, String page, int pageNumber) {
		// 확인용 나중에 지우고 s_seq파라미터 seq로 변경 
		
		
		System.out.println("page: " + page);
		
		int n = eservice.msgOpen(seq);
		MessageDto msg = eservice.getMsgDetail(seq);
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("page", page);
		model.addAttribute("msgDetail", msg);
	
		return "e_apply/seeMsg";
	}
	
	
	@RequestMapping(value="outMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getOutMsgList(Model model, MessageParam param){
		
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
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "e_apply/outMsg";
	}
	
	@RequestMapping(value="impoMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getImpoMsgList(Model model, MessageParam param) {
		
		
		
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
		
		model.addAttribute("impoMsglist", impoMsgList);
		model.addAttribute("totalRecordCount", ImpoCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		
		return "e_apply/impoMsg";
	}
	
	
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
	
	@ResponseBody
	@RequestMapping(value="sendMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int sendMsg(MessageDto dto) {
		
		System.out.println(dto.toString());
		
		// 나중에 login Session에서 받아서 seq 넣어주기
		dto.setFrom(1);
		
		int result = eservice.sendMsg(dto);
		
	
		return result;
	}
	
	
}

















