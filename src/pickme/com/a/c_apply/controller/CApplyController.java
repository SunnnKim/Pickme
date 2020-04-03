package pickme.com.a.c_apply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.CApplyDto;
import pickme.com.a.c_apply.service.CApplyService;

@Controller
@RequestMapping(value = "/c_apply")
public class CApplyController {
	
	@Autowired
	CApplyService cApplyService;
	
	@RequestMapping(value = "getRequestList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewTest(Model model) {
		
		List<CApplyDto> list = cApplyService.getRequestList();
		
		model.addAttribute("requestList", list);
		return "c_apply/requestList";
	}
	
	@RequestMapping(value = "c_message.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String c_message() {
		return "c_apply/c_message";
	}
	
	@GetMapping(value="important_thing.do")
	public void star_msg(int a, HttpSession session) {
		/*
		 * //유저디티오 디티오 = (유저디티오)session.getAttribute("loginUser"); // String id =
		 * 디티오.getId();
		 * 
		 * recruitService.star_msg(a, id);
		 */
	}
}
