package pickme.com.a.e_apply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.EApplyDto;
import model.EApplyParam;
import pickme.com.a.e_apply.service.EApplyService;

@Controller
@RequestMapping("e_apply")
public class EApplyController {

	@Autowired
	EApplyService eservice;
	@RequestMapping(value="curApplyList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCurApplyList(Model model, HttpSession session, EApplyParam param) {
		
		// session에서 login seq 받아오기 
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
				
		// 로그인한 아이디 세팅 
		param.setLoginSeq(loginSeq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end + "sort: " + param.getSort() + "filter" + param.getFilter());
		
		param.setStart(start);
		param.setEnd(end);
		
		List<EApplyDto> myApplyList = (List<EApplyDto>)eservice.getCurAList(param); 
		System.out.println("myApplyListSize: " + myApplyList.size());
	    // 총 지원한 횟수
		int totalRecordCount = eservice.getTotalRecordCount(param);
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		model.addAttribute("sort", param.getSort());
		model.addAttribute("filter", param.getFilter());
		model.addAttribute("myApplyList", myApplyList);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/curApplyList";
	}
	
	@RequestMapping(value="pastApplyList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getPastAList(Model model, HttpSession session, EApplyParam param) {
		
		// session에서 login seq 받아오기 
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		// 받아온 seq param에 셋팅하기 
		param.setLoginSeq(loginSeq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		// 시작, 끝 글의 번호를 param 에 셋팅하기
		param.setStart(start);
		param.setEnd(end);
		
		List<EApplyDto> myPastApplyList = (List<EApplyDto>)eservice.getPastAList(param); 
		System.out.println("myPastApplyListSize: " + myPastApplyList.size());
		int totalRecordCount = eservice.getTotalPastCount(param);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		
		model.addAttribute("myPastApplyList", myPastApplyList);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		return "e_apply/pastApplyList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="cancelApply.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int cancelApply(int seq) {
		
		System.out.println("cancelApply.do");
		
		
		int result = eservice.cancelApply(seq);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="delApply.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public int delApply(int[] seqArray) {
		System.out.println("seqArray: " + seqArray.length);
		int result = 0;
		for (int i = 0; i < seqArray.length; i++) {
			System.out.println("seq: " + seqArray[i]);
			result = eservice.deleteApply(seqArray[i]);
		}
		
		return result;
	}




}
