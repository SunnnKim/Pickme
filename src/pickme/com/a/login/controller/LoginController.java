package pickme.com.a.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pickme.com.a.login.service.CustomUserDetailsService;
import pickme.com.a.login.service.LoginService;

@RequestMapping("/login")
@Controller
public class LoginController {
   
	private CustomUserDetailsService service;

	
	@Autowired
	LoginService login;
	
   // 테스트용 로그인폼 
   @RequestMapping(value="loginform.do")
   public String loginForm() {
      return "login/loginsample";
   }
   
   // 메인페이지 
   @RequestMapping(value="main.do")
   public String mainView() {
      return "main/main";
   }
   
   // 회원용 로그인페이지
   @RequestMapping(value="memLogin.do")
   public String memLogin() {
      return "login/memLogin";
   }
   
   // 회원용 회원가입 페이지
   @RequestMapping(value="memJoin.do")
   public String memJoin() {
      return "login/memJoin";
   }
   
   // 기업로그인 페이지 
   @RequestMapping(value="comLogin.do")
   public String comLoginView() {
      return "login/comLogin";
   }
   
   // 기업회원가입 페이지 
   @RequestMapping(value="comJoin.do")
   public String comJoinView() {
      return "login/comJoin";
   }
   
   @ResponseBody
   @RequestMapping(value="emailCheckA.do", method=RequestMethod.POST, produces="application/String; charset=utf-8")
   public String emailCheckA( String username ) {
	   System.out.println(username);
	   String a = login.emailCheck(username);
	   if(!a.equals("")) {
		   System.out.println(a);
	   }
	   else {
		   System.out.println("null");
	   }
	   return true + "";
   }
  
   
   
   /*
   @RequestMapping("mypage.do")
   public void mypage() {}
   
   @RequestMapping("signform.do")
   public void signform() {}
   
   @RequestMapping("signup.do")
   public String signup(AMemberDto user) {
      user.setPassword( new BCryptPasswordEncoder().encode(user.getPassword()) );
      service.signup(user);
      return "login/loginform";
   }
   
   @RequestMapping(value="test")
   public String test() {
      return "index2";
   }
   */
}