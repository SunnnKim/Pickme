package pickme.com.a.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pickme.com.a.admin.service.NoticeService;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

	@Autowired
	NoticeService service;
	
	@RequestMapping(value ="noticeView.do", method=RequestMethod.POST)
	public String noticeView(Model model) {
		
		return "admin/notice/noticeAll";
	}
	
	
}
