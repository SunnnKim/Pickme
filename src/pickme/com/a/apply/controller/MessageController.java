package pickme.com.a.apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/apply")
public class MessageController {
	
	@RequestMapping(value="inMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getInMsgList() {
		
		
		return "apply/inMsg";
	}
	
	@RequestMapping(value="outMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getOutMsgList(){
		
		
		return "apply/outMsg";
	}
	
	@RequestMapping(value="impoMsg.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getImpoMsgList() {
		
		return "apply/impoMsg";
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteMsg() {
		
		// ajax처리 
		return "";
	}
	
	@RequestMapping(value="seeMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public String seeMsg() {
		
		return "apply/seeMsg";
	}
}
