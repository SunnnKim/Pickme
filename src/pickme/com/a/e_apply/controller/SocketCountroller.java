package pickme.com.a.e_apply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.EInterestDto;
import model.MessageParam;
import pickme.com.a.e_apply.service.EInterestService;
import pickme.com.a.e_apply.service.EMessageService;

@Controller
public class SocketCountroller {
	
	@Autowired
	EMessageService eservice;
	
	@Autowired
	EInterestService interestService;
	
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
		
	// 최신 공고 웹소켓
	  @ResponseBody
	  @RequestMapping(value="recentLikeRecruit.do", method= {RequestMethod.GET, RequestMethod.POST})
	  public String getRecentLikeRecruit(HttpSession session) {
		  String email = ((AMemberDto) session.getAttribute("loginuser")).getEmail();
		  
		  List<EInterestDto> list = interestService.getRecentLikeRecruit(email);
		  
		  String msg = null;
		  
		  if(list != null) {
			  msg = "<table>"
			  		+ "<col width='100px'>"
			  		+ "<col width='200px'>"
			  		+ "<tr> "
			  			+ "<th>기업명</th>"
			  			+ "<th>제목</th>"
			  		+ "</tr>";
			  
			  for (int i = 0; i < list.size(); i++) {
				  
				 msg = msg + "<tr><td>" + list.get(i).getComName() + "</td><td><a href='Pickme/searchJob/recDetail.do?seq="
				           + list.get(i).getSeq() + ">" + list.get(i).getTitle() + "</a></td><tr>"; 	
			}
			  msg = msg + "</table>"; 
		  }
		  return msg;
	  }
}
