package pickme.com.a.recruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
	
	
	//테스트 insert view
	@RequestMapping(value = "recInsert.do")
	public String recInsert() {
		return "recruit/recInsert";
	}
	
	@RequestMapping(value = "recDetail.do")
	public String recDetail() {
		return "recruit/recDetail";
	}
	
	
	
}
