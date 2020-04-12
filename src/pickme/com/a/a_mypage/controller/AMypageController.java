package pickme.com.a.a_mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/a_mypage")
public class AMypageController {
	
	// 프로필
	@RequestMapping(value = "profile.do")
	public String profileView() {
		return "a_mypage/profile";
	}
	
	
}
