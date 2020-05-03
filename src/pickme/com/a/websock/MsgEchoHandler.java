package pickme.com.a.websock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import model.AMemberDto;
import model.CMemberDto;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class MsgEchoHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		System.out.println("연결 성공했습니다!!!!!!!!!!!!!!!");
		String loginEmail = getEmail(session);
		System.out.println("loginEmail: " + loginEmail);
		userSessionsMap.put(loginEmail , session);
		
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("소켓에 메시지 도착!");
		System.out.println("handleTextMessage:" + session + ": " + message);
		String loginEmail = getEmail(session);
		System.out.println("loginEmail: " + loginEmail);
		
		
		// 메시지에 띄워보낼 내용을 직접 정해주면 된다. 원래는 JSON으로 하는게 제일 좋음. ,로 split할거라서 공백넣지 않게 주의 
		//protocol :보낸사람이 기업인지, 일반인지구별자, cmd, 메시지 보낸사람이름, 받는사람이메일(기업, 개인 seq겹칠 수 있으므로 이메일로 구분), 
		//          메시지seq(alert에서 a tag로 msgDetail로 가도록 하기 위함), unread메시지 갯수
		String msg = message.getPayload();
		System.out.println(">>>>>>>>>>>>>>>>>  : " + msg);
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			System.out.println("strs길이: " + strs.length);
			if(strs != null && strs.length == 7) {
				
				String distinguish = strs[0];
				String cmd=strs[1];
				String senderName = strs[2]; 
				String receiverEmail = strs[3];
				String msgSeq = strs[4];
				String msgCount = strs[5];
				String likerecruitList = strs[6];
			
				System.out.println("cmd: " + cmd);
			    if("alert".equals(cmd)) {
					//수신인이 로그인해 있다면
					WebSocketSession receiverSession = userSessionsMap.get(receiverEmail.trim());
					System.out.println("receiverEmalil " + receiverEmail);
					System.out.println("있나요?: " + receiverSession);
					
					if("com".equals(distinguish) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage("<a href='../c_apply/msgDetail.do?msgSeq=" + msgSeq +  "&page=cRcvMsg&pageNumber=0&unread=0'>"
								+ "<img src='../images/main/bell.png' width='20px' height='20px'><span>[" + senderName + "]</span>님으로부터 새로운메시지가 도착하였습니다.</a>"); 
						
						receiverSession.sendMessage(tmpMsg);
					}else if("mem".equals(distinguish)) {
						TextMessage tmpMsg = new TextMessage("<a href='../e_apply/seeMsg.do?seq=" + msgSeq +  "&page=inMsg&pageNumber=0&unread=0'>"
								+ "<img src='../images/main/bell.png' width='20px' height='20px'><span>[" + senderName + "]</span>님으로부터 새로운메시지가 도착하였습니다.</a>"); 
						receiverSession.sendMessage(tmpMsg);
						
					}
			    }else if("unread".equals(cmd)) {
			    	WebSocketSession loginSession = userSessionsMap.get(loginEmail.trim());
			    	System.out.println("로그인세션: " +loginSession);
			    	System.out.println("msgCount>>>" + msgCount);
			    	TextMessage tmpMsg = new TextMessage(msgCount); 	
					loginSession.sendMessage(tmpMsg);
			    	
			    }else if("recruit".equals(cmd)) {
			    	WebSocketSession loginSession = userSessionsMap.get(loginEmail.trim());
			    	// TextMessage tmpMsg = new TextMessage(); 
			    	// loginSession.sendMessage(tmpMsg);
			    	System.out.println("likerecruitList: " + likerecruitList);
			    	TextMessage tmpMsg = new TextMessage(likerecruitList); 
			    	loginSession.sendMessage(tmpMsg);
			    }
			}
	
		}
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
	AMemberDto loginUser = (AMemberDto)httpSession.get("loginuser");
	CMemberDto 	loginCompany = (CMemberDto)httpSession.get("logincompany"); 
		
	  if(loginUser == null && loginCompany == null) {
			return session.getId();
		} else if(loginCompany != null){
			String loginEmail = loginCompany.getEmail();
			System.out.println("로그 이메일: " + loginEmail);
			return loginEmail;
		}else {
			String loginEmail = loginUser.getEmail();
			System.out.println("로그 이메일: " + loginEmail);
			return loginEmail;
			
		}
	
	  
	  
	}
 
	

}
