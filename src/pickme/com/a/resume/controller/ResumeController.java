package pickme.com.a.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/resume")
public class ResumeController {
	
	// 이력서 관리 페이지 이동
	@RequestMapping(value = "resume.do")
	public String resumeView() {		
		
		return "resume/resume";
	}
	
	
	// 이력서 작성 페이지 이동
	@RequestMapping(value = "resumeWrite.do")
	public String resumeWriteView() {		
		
		return "resume/resumeWrite";
	}
}
