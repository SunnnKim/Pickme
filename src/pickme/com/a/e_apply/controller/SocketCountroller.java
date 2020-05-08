package pickme.com.a.e_apply.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	  @RequestMapping(value="recentLikeRecruit.do", produces="application/String;charset=utf8", method= {RequestMethod.GET, RequestMethod.POST})
	  public String getRecentLikeRecruit(HttpSession session) {
		  String email = ((AMemberDto) session.getAttribute("loginuser")).getEmail();
		  System.out.println("=======================getRecentLikeRecruit");
		  List<EInterestDto> list = interestService.getRecentLikeRecruit(email);
		  System.out.println("list.size():" + list.size());
		  String msg = null;
		  
		  if(list.size() > 0) {
			  msg = "<div id='recruitExist' class='alertContWrap'>" + 
			  		"<div class='tit'><a href='/Pickme/e_apply/interestComRecruit.do'><strong>관심기업 최신 채용공고</strong><span>+</span></a></div>	" + 
			  		"<ul>";
			  for (int i = 0; i < list.size(); i++) {
				 
				  
				  if(list.get(i).getLogoname() == null){
					  msg = msg + "<li><a href='/Pickme/searchJob/recDetail.do?seq=" + list.get(i).getSeq() +"'>" +		 
						 		"<div class='img'><img src='/Pickme/images/sub/no-img.png' alt='기업로고'></div>" ;
					  
				  }else {
					  msg = msg + "<li><a href='/Pickme/searchJob/recDetail.do?seq=" + list.get(i).getSeq() +"'>" +		 
					 		"<div class='img'><img src='/Pickme/getComLogo.do?filename=" + list.get(i).getLogoname() + 
					 		"&filepath=" + list.get(i).getLogopath() + "' alt='기업로고'></div>" ;
				  }
				  
					 msg = msg + "<div class='txt'>" + 
							        "<h3>" + list.get(i).getComName() + "</h3>"+ 
							 	    "<p>~" + list.get(i).getEdate() + "</p>" + 
								    "<p>" + list.get(i).getComjob1() + "</p>" + 
					     	    "</div>" + 
							 	"</a></li>";
			  }
			  msg = msg + "</ul></div>"; 
		  }		  
		  System.out.println("msg>>>>>>> " + msg);
		  return msg;
	  }
	  
	// 회사로고 불러오기 
		@RequestMapping(value="getComLogo.do")
		 protected void getComLogo(HttpServletRequest request, HttpServletResponse response, String filename, String filepath) throws ServletException, IOException {
				   
			  request.setCharacterEncoding("utf-8");
			  response.setCharacterEncoding("utf-8");
			  response.setContentType("text/html; charset=utf-8");
		      System.out.println("file download connected");
		      
		      System.out.println("download serv logopath :"+ filepath);
		      System.out.println("download serv logoname :"+ filename);

		      
		      String uploadRoot = request.getSession().getServletContext().getRealPath(filepath);
		      System.out.println("uploadRoot:"+uploadRoot);

		      File f = new File(uploadRoot + filename);

		      response.setHeader("Content-Type", "image/jpg");

		      // 파일을 읽고 사용자에게 전송
		      FileInputStream fis;
			try {
				fis = new FileInputStream(f);
				BufferedInputStream bis = new BufferedInputStream(fis);
				OutputStream out = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				while (true) {
					int ch = bis.read();
					if (ch == -1)
						break;
					bos.write(ch);
				}
				
				bis.close();
				fis.close();
				bos.close();
				out.close();
				
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("filedownload error:" + e.getMessage());
			}
				
		}	
			
}
