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
import model.EInterestDto;
import model.EInterestParam;
import pickme.com.a.e_apply.service.EInterestService;

@Controller
@RequestMapping(value="e_apply") 
public class EInterestController {

	@Autowired
	EInterestService eservice;
	
	// 관심기업 리스트 가져오기
	@RequestMapping(value="interestCom.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getInterComList(HttpSession session, EInterestParam param, Model model) {
		System.out.println("===============================================");
		String email = ((AMemberDto) session.getAttribute("loginuser")).getEmail();
		System.out.println("interestCom.do");
		
		
		System.out.println("email: " + email);
		param.setEmail(email);
		
		//관심 채용 설정 
		param.setAuth(1);
		
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
		model.addAttribute("sKeyword", param.getsKeyword());
		return "e_apply/interestCom";
	}

	// 관심기업 취소 
	@ResponseBody
	@RequestMapping(value="removefav.do", method={RequestMethod.GET, RequestMethod.POST})
	public int removefav(HttpSession session, EInterestParam param,  Model model) {
		System.out.println("removeFav");
		int result = eservice.removefav(param);
		return result;
	}
	
	// 관심기업 채용공고 가져오기 
	@RequestMapping(value="interestComRecruit.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getinterestComRecruiteList(HttpSession session, Model model, EInterestParam param) {
		AMemberDto loginDto = (AMemberDto) session.getAttribute("loginuser");
		String email = loginDto.getEmail();
		int memseq = loginDto.getSeq();
		
		param.setEmail(email);
		param.setMemseq(memseq);
		
		//관심 채용 설정 
		param.setAuth(1);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		List<EInterestDto> list = eservice.getInterComRecruitList(param);
		int totalRecordCount = eservice.getTotalinterComRecruit(param);
		
		
		for (int i = 0; i < list.size(); i++) {
		    // 채용공고 seq 
			int jobseq = list.get(i).getSeq();
			param.setJobseq(jobseq);
			int count = eservice.applychk(param);
			System.out.println("count: " + count);
			
			// apply 여부 등록 (0: 지원전 / 1: 지원함)
			list.get(i).setApply(count);
			
		}
		
		model.addAttribute("sort", param.getSort());
		model.addAttribute("filter", param.getFilter());
		model.addAttribute("interComRecruitList", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/interestComRecruit";
	}
	
	
	@RequestMapping(value="likeRecruit.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getLikeRecruiteList(HttpSession session, EInterestParam param, Model model) {
		
		AMemberDto loginDto = (AMemberDto)session.getAttribute("loginuser");
		String email = loginDto.getEmail();
		int memseq = loginDto.getSeq();
		
		//관심 채용 설정 
		param.setAuth(3);
		
		param.setEmail(email);
		param.setMemseq(memseq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		
		List<EInterestDto> list = eservice.getLikeRecruitList(param);
	
		System.out.println("list.size()" + list.size());
		
		for (int i = 0; i < list.size(); i++) {
		    // 채용공고 seq 
			int jobseq = list.get(i).getLikepickseq();
			param.setJobseq(jobseq);
			int count = eservice.applychk(param);
			System.out.println("count: " + count);
			
			// apply 여부 등록 (0: 지원전 / 1: 지원함)
			list.get(i).setApply(count);
			
		}
		
		int totalRecordCount = eservice.getTotallikeRecruitCount(param);
		System.out.println("totalRecordCount: " + totalRecordCount );

		model.addAttribute("sort", param.getSort());
		model.addAttribute("filter", param.getFilter());
		model.addAttribute("likeRecruitList", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("pageNumber", pn);
		model.addAttribute("sKeyword", param.getsKeyword());
		
		return "e_apply/likeRecruit";
	}
	
}
