package pickme.com.a.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pickme.com.a.login.service.LoginService;

//@RequestMapping("/login")
@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="loginform.do")
	public String loginForm() {
		return "login/loginform";
	}
	
	
	@RequestMapping(value="logout")
	public void logout(HttpSession session) {
		session.removeAttribute("id");
	}

	@RequestMapping(value="test")
	public String test() {
		return "index2";
	}
	
}