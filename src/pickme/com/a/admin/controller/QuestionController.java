package pickme.com.a.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.QuestionDto;
import pickme.com.a.admin.service.QuestionService;
import pickme.com.a.util.MailUtil;

@Controller
@RequestMapping("/admin/question")
public class QuestionController {

	@Autowired
	QuestionService service;
	
	// 문의하기 
	@RequestMapping(value="insertQuestion.do",method=RequestMethod.POST)
	public String insertQuestion( QuestionDto dto ) {
		// 문의사항 디비에 추가
		boolean success = service.insertQuestion(dto);
		// 성공시 
		if( success ) return "redirect:/customer/noticeList.do";
		// 실패시 
		return "redirect:/customer/customerService.do";
	}
	
	// 관리자 - 문의사항리스트 페이지
	@RequestMapping(value="questionList.do")
	public String questionList(Model model) {
		
		// 모든 내역 불러오기 
		List<QuestionDto> allList = service.getAllQuestion();
		// 미응답 내역 불러오기 
		List<QuestionDto> notAnswerList = service.getNotAnsweredQuestion();
		// 문의 내역 종류별 통계치 
		List<QuestionDto> typeStatistic = service.getTypeOfQuestion();

		model.addAttribute("allList", allList);
		model.addAttribute("notAnswerList", notAnswerList);
		model.addAttribute("typeStatistic", typeStatistic);
		
		return "admin/question/questionList";
	}
	
	// 답변하기 페이지 이동 
	@RequestMapping(value="answerQuestion.do")
	public String answerQuestion(int seq, Model model) {
		System.out.println(seq);
		QuestionDto detail = service.getQuestionDetail(seq);
		model.addAttribute("detail", detail);
		
		return "admin/question/questionDetail";
		
	}
	
	// 답변메일 보내기 
	@RequestMapping(value="sendQuestionEmail.do")
	public String sendQuestionEmail( QuestionDto reply) {
		// 답변 디비에 등록하기 
		reply.setContent(reply.getReply().replaceAll("\n", "<br>"));;
		System.out.println(reply);
		boolean success = service.updateQuestionReply(reply);
		
		if(!success) return "redirect:/admin/question/answerQuestion.do?seq=" + reply.getSeq();
		reply = service.getQuestionDetail(reply.getSeq());
		
		// 메일 쓰기 
		String subject = "[ Pick Me ] 문의내역에 대한 답변입니다.";

		String msg = "";
		msg += "<div style=\"margin: 30px 10px; font-size: 30px; font-weight: 300; background: #304edf; "
				+ "color: #fff; height: 60px; line-height: 60px; text-align: center;\">" + "[ Pick Me ] 문의내역 답변</div>";
		msg += "<div style=\"padding: 10px 30px; padding-bottom: 20px; margin-bottom: 30px; border-bottom: 1px solid #eaeaea;\">";
		msg += "<p>" + reply.getReply().replaceAll("\n", "<br>") + "</p>";
		msg += "<div style=\"margin: 10px 0; margin-top: 30px; font-size: 20px;\">Pick Me 관리자 드림</div></div>";
		msg += "<div style=\"padding-left: 50px; margin-bottom: 10px;\">"
				+ "이전 문의글 :<span style=\"margin-left: 10px; font-size: 20px;\">제목입니다</span></div>";
		msg += "<div style=\"padding: 0 50px;\">";
		msg += "<p>" + reply.getContent().replaceAll("\n", "<br>") + "</p>";
		msg += "<div>작성일 : " + reply.getwDate()+ 
				"</div>";

		// 메일 보내기 
		try {
			 MailUtil.sendMail(reply.getEmail(), subject, msg);
		} catch (Exception e) {
			e.getMessage();
			return "redirect:/admin/question/answerQuestion.do?seq=" + reply.getSeq();
		}
		 
		return "redirect:/admin/question/questionList.do";
		
	}
	
	// 문의내역 모두 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteQuestion.do", method=RequestMethod.POST)
	public boolean deleteQuestion(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.deleteQuestion(seqList);
		
		return success;
	}
	
	// 문의내역 응답으로 처리하기
	@ResponseBody
	@RequestMapping(value="passQuestion.do", method=RequestMethod.POST)
	public boolean passQuestion(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.passQuestion(seqList);
		
		return success;
	}
	
	@Scheduled(cron = "30/10 34-37 0 ? * *")
	public void TestScheduler(){
        System.out.println("스케줄링 테스트");
    }
	
	
	
}
