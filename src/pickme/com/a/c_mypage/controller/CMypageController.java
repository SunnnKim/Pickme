package pickme.com.a.c_mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.CMemberMypageDto;
import pickme.com.a.c_mypage.service.CMypageService;

@Controller
public class CMypageController {

	@Autowired
	CMypageService service;
	
	
	@RequestMapping(value = "test.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(CMemberMypageDto dto, Model model) {
		CMemberMypageDto list = service.dateTest(dto);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "index2";
	}
}
