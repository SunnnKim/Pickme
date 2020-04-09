package pickme.com.a.recruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
	
	
	
	@RequestMapping(value = "recInsert.do")
	public String recInsert() {
		return "recruit/recInsert";
	}
	@RequestMapping(value = "recNow.do")
	public String recNow() {
		return "recruit/recNow";
	}
	@RequestMapping(value = "recPast.do")
	public String recPast() {
		return "recruit/recPast";
	}
	
	@RequestMapping(value = "recDetail.do")
	public String recDetail() {
		return "recruit/recDetail";
	}
	
	@RequestMapping(value = "recInsertAf.do")
	public String recInsertAf() {
		return "redirect:/login/main.do";
	}
	
	
	
}
