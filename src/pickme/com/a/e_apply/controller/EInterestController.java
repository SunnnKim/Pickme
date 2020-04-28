package pickme.com.a.e_apply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.AMemberDto;
import model.EInterestDto;
import model.EInterestParam;
import pickme.com.a.e_apply.service.EInterestService;

@Controller
@RequestMapping(value="e_apply") 
public class EInterestController {

	@Autowired
	EInterestService eservice;
	
	
	@RequestMapping(value="interestCom.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getInterComList(HttpSession session, EInterestParam param, Model model) {
		System.out.println("===============================================");
		String email = ((AMemberDto) session.getAttribute("loginuser")).getEmail();
		System.out.println("interestCom.do");
		
		
		System.out.println("email: " + email);
		param.setEmail(email);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
	
		// EInterestParam에 세팅 
		param.setStart(start);
		param.setEnd(end);
		
		List<EInterestDto> list = eservice.getInterComList(param);
		System.out.println("list.size" + list.size());
		
		
		int totalRecordCount = eservice.getTotalInterComCount(param);
		
		System.out.println("totlaRecordCouont:" + totalRecordCount);
		
		System.out.println("===============================================");
		
		model.addAttribute("interComList", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		return "e_apply/interestCom";
	}
	/*
	@RequestMapping(value="removefav.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getInterComList(HttpSession session, int likepickseq,  Model model) {
		
		int result = eservice.removefav(likepickseq);
		return result;
	}
	*/
	
	@RequestMapping(value="interestComRecruit.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getinterestComRecruiteList(HttpSession session) {
		
		
		return "e_apply/interestcomRecruit";
	}
	
	
	@RequestMapping(value="likeRecruit.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getLikeRecruiteList(HttpSession session) {
		
		
		return " e_apply/likeRecruit";
	}
	
}
