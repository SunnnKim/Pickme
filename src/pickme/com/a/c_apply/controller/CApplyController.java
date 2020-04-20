package pickme.com.a.c_apply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pickme.com.a.c_apply.service.CApplyService;

@Controller
@RequestMapping(value = "/c_apply")
public class CApplyController {

	@Autowired
	CApplyService cApplyService;
	
	@RequestMapping(value = "cApplyList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cApplyList(Model model, HttpSession session) {
		
		return "c_apply/cApplyList";
	}
}
