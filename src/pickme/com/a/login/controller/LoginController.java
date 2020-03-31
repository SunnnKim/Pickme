package pickme.com.a.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import model.User;
import pickme.com.a.login.service.LoginService;

@RequestMapping("/login")
@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="loginform.do")
	public String loginForm() {
		return "login/loginform";
	}
	
	@RequestMapping("mypage.do")
	public void mypage() {}
	
	@RequestMapping("signform.do")
	public void signform() {}
	
	@RequestMapping("signup.do")
	public String signup(User user) {
		user.setPassword( new BCryptPasswordEncoder().encode(user.getPassword()) );
		service.signup(user);
		return "login/loginform";
	}
	
	@RequestMapping(value="test")
	public String test() {
		return "index2";
	}
	
}