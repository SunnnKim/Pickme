package pickme.com.a.e_apply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.EApplyDto;
import model.MessageParam;
import pickme.com.a.e_apply.service.EApplyService;

@Controller
@RequestMapping("e_apply")
public class EApplyController {

	@Autowired
	EApplyService eservice;
	@RequestMapping(value="curAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCurAList(Model model, MessageParam param) {
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<EApplyDto> myApplyList = (List<EApplyDto>)eservice.getCurAList(param); 
		System.out.println("myApplyListSize: " + myApplyList.size());
		
		// System.out.println("msg확인: " + msg.get(0).toString());
		
		
		int totalRecordCount = eservice.getTotalRecordCount(param);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		
		model.addAttribute("myApplyList", myApplyList);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/curAList";
	}
	
	@RequestMapping(value="pastAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getPastAList(Model model, MessageParam param) {
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<EApplyDto> myPastApplyList = (List<EApplyDto>)eservice.getPastAList(param); 
		System.out.println("myPastApplyListSize: " + myPastApplyList.size());
		
		// System.out.println("msg확인: " + msg.get(0).toString());
		
		
		int totalRecordCount = eservice.getTotalPastCount(param);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		
		model.addAttribute("myPastApplyList", myPastApplyList);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		return "e_apply/pastAList";
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
	public int[] delApply(int[] seqArray) {
		System.out.println("seqArray: " + seqArray.length);
		
		
		int[] result = eservice.deleteApply(seqArray);
		
		return result;
	}




}
