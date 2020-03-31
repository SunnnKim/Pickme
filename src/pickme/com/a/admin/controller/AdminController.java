package pickme.com.a.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pickme.com.a.admin.service.AdminService;


@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@RequestMapping(value = "test.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String test(Model model) {
		return "recruit/ViewTest";
	}

}
