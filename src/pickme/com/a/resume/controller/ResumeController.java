package pickme.com.a.resume.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeDto;
import model.ResumeParam;
import pickme.com.a.a_mypage.service.AMypageService;
import pickme.com.a.resume.service.ResumeService;

@Controller
@RequestMapping(value="/resume")
public class ResumeController {
	
	@Autowired
	AMypageService aMypageService;
	
	@Autowired
	ResumeService service;
	
	// 이력서 관리 페이지 이동 
	@RequestMapping(value = "resume.do")
	public String resumeView(Model model, ResumeParam param,  HttpSession session) {		
		
		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		param.setMemSeq(memSeq);
		
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("현재 페이지 : "+ nowPage);
		
		param.setStart(start);
		param.setEnd(end);
		
		// 이력서 count
		int totalRecCount = service.ResumeCount(param);
		System.out.println("이력서 count:" + totalRecCount);
		
		List<ResumeDto> list = service.ResumeAllList(param);
		System.out.println("Resume List Size : " + list.size());
		model.addAttribute("resumeList",list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage()); // 한 페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount);
		return "resume/resume";
	}
	
	// 이력서 관리 이력서명 변경
	@ResponseBody
	@RequestMapping(value = "ResumeNameUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int ResumeNameUpdate(ResumeDto dto, Model model) {		
		System.out.println("ResumeController ResumeNameUpdate.do 도착");
		
		int rs = service.ResumeNameUpdate(dto);	
		
		model.addAttribute("rs", rs);
		System.out.println("rs : " + rs);
		
		return rs;
		
		
	}
	
	// 이력서 관리 메인 이력서 변경
	@ResponseBody
	@RequestMapping(value = "MainResumeUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int MainResumeUpdate(Integer memSeq, Integer seq, Model model) {		
		System.out.println("ResumeController MainResumeUpdate.do 도착");

		System.out.println("메인이력서 memSeq" + memSeq);
		System.out.println("메인이력서" + seq);
		
		int reset = service.MainResumeReset(memSeq);			
		int update = service.MainResumeUpdate(seq);	
		
		//model.addAttribute("reset", reset);
		//System.out.println("reset : " + reset);
		
		//model.addAttribute("update", update);
		System.out.println("update : " + update);
		
		return update;
		
		
	}
	
	// 이력서 삭제
	@ResponseBody
	@RequestMapping(value = "ResumeDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int MainResumeUpdate(Integer seq, Model model, HttpSession session) {		
		System.out.println("ResumeController ResumeDelete.do 도착");
		
		int rs = service.ResumeDelete(seq);	
		
		model.addAttribute("rs", rs);
		System.out.println("rs : " + rs);
		
		return rs;
		
		
	}
	
	// 이력서 detail & update 페이지
	@RequestMapping(value = "resumeView.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String resumeView(Model model, HttpSession session) {		
			
		System.out.println("ResumeController resumeView.do 도착");
		
		
		//int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		
		
		

		return "resume/resumeView";
		
	}

	
	// 이력서 작성 페이지 이동
	@RequestMapping(value = "resumeWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String resumeWriteView(Model model, HttpSession session) {		

		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		model.addAttribute("memdto", aMypageService.profileSelect(memSeq));
		
		int resumeSeq = service.resumeGetSeq();
		System.out.println("resumeSeq" + resumeSeq);
		
		model.addAttribute("resumeSeq", resumeSeq);

		return "resume/resumeWrite";
		
	}
	

	// 이력서 작성 insert 
	@ResponseBody
	@RequestMapping(value = "resumeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int resumeInsert(ResumeDto dto, Model model) {		
		System.out.println("ResumeController resumeInsert.do 도착");
		
		
		System.out.println("ResumeDto dto : " + dto.toString());

		int a = service.resumeInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 경력 insert 
	@ResponseBody
	@RequestMapping(value = "careerInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, CareerDto dto, Model model) {		
		System.out.println("ResumeController careerInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		int rsmseq = Integer.parseInt(strRsmseq);
		
		dto.setRsmseq(rsmseq);
		
		System.out.println("CareerDto dto : " + dto.toString());		
		
		int a = service.careerInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 학력 insert 
	@ResponseBody
	@RequestMapping(value = "educationInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, EducationDto dto, Model model) {		
		System.out.println("ResumeController educationInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		int rsmseq = Integer.parseInt(strRsmseq);
		
		dto.setRsmseq(rsmseq);
		
		System.out.println("EducationDto dto : " + dto.toString());		
		
		int a = service.educationInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 수상 및 기타 insert 
	@ResponseBody
	@RequestMapping(value = "AwardsEtcInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, AwardsEtcDto dto, Model model) {		
		System.out.println("ResumeController AwardsEtcInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		int rsmseq = Integer.parseInt(strRsmseq);
		
		dto.setRsmseq(rsmseq);
		
		System.out.println("AwardsEtcDto dto : " + dto.toString());		
		
		int a = service.AwardsEtcInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 외국어 insert 
	@ResponseBody
	@RequestMapping(value = "LanguageInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, LanguageDto dto, Model model) {		
		System.out.println("ResumeController LanguageInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		int rsmseq = Integer.parseInt(strRsmseq);
		
		dto.setRsmseq(rsmseq);
		
		System.out.println("LanguageDto dto : " + dto.toString());		
		
		int a = service.LanguageInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 링크 insert 
	@ResponseBody
	@RequestMapping(value = "LinkInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, LinkDto dto, Model model) {		
		System.out.println("ResumeController LinkInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		int rsmseq = Integer.parseInt(strRsmseq);
		
		dto.setRsmseq(rsmseq);
		
		System.out.println("LinkDto dto : " + dto.toString());		
		
		int a = service.LinkInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	
	
	
	
	
	
}
