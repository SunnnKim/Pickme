package pickme.com.a.recruit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.RequestDto;
import pickme.com.a.recruit.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
	RecruitService recruitService;
	
	@RequestMapping(value = "getRequestList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewTest(Model model) {
		
		List<RequestDto> list = recruitService.getRequestList();
		
		model.addAttribute("requestList", list);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value = "c_message.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String c_message() {
		return "recruit/c_message";
	}
}
