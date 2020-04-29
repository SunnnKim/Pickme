package pickme.com.a.resume.controller;

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
import model.ResumeDto;
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
	public String resumeView() {		
		
		return "resume/resume";
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
