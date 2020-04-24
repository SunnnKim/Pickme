package pickme.com.a.e_apply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.MessageParam;
import pickme.com.a.e_apply.service.EMessageService;

@Controller
public class SocketCountroller {
	
	@Autowired
	EMessageService eservice;
	
	// 메시지 갯수
		@ResponseBody
		@RequestMapping(value="totalMsgCount.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String totalMsgCount(HttpSession session) {
			// session에서 login seq 받아오기 
			int toSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
					
			System.out.println("로그인아이디: " + toSeq);
			// 받은 사람 seq 를 수신인 seq로 셋팅 
			MessageParam  param = new MessageParam();
			param.setToSeq(toSeq);
					
			int totalMsgCount = eservice.unreadCount(toSeq);
			System.out.println("totalMsgCount: " +totalMsgCount);
			
			return totalMsgCount + "";
		
		}

}
