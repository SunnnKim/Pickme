package pickme.com.a.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.CMemberDto;
import pickme.com.a.login.service.LoginService;
import pickme.com.a.login.service.LoginServiceForCompany;

@RequestMapping("/login")
@Controller
public class LoginController {

	@Autowired
	LoginService aMember;	// 일반회원 
	@Autowired
	LoginServiceForCompany cMember;	// 기업회원 
	

	// 테스트용 로그인폼
	@RequestMapping(value = "loginform.do")
	public String loginForm() {
		return "login/loginsample";
	}

	// 메인페이지
	@RequestMapping(value = "main.do")
	public String mainView() {
		return "main/main";
	}
	
	// 회원용 로그인페이지
	@RequestMapping(value = "memLogin.do")
	public String memLogin() {
		return "login/memLogin";
	}
	
	// 회원용 회원가입 페이지
	@RequestMapping(value = "memJoin.do")
	public String memJoin() {
		return "login/memJoin";
	}
	
	// 기업로그인 페이지
	@RequestMapping(value = "company/comLogin.do")
	public String comLoginView() {
		return "login/company/comLogin";
	}
	
	// 기업회원가입 페이지
	@RequestMapping(value = "company/comJoin.do")
	public String comJoinView() {
		return "login/company/comJoin";
	}
	
	
	// 일반 이메일 있는지 체크
	@ResponseBody
	@RequestMapping(value = "emailCheckAll.do", method = RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String emailCheckA(String username) {
		String a = aMember.emailCheck(username);
		if (!a.equals(""))
			return true + "";
		return false + "";
	}

	// 일반회원 가입 (암호화)
	@RequestMapping(value= "memberJoin.do", method = RequestMethod.POST)
	public String memberJoin(AMemberDto member) {
		// 암호화
		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		System.out.println("암호화 함 : " + member);
		aMember.signup(member); // DB에 넣기
		return "redirect:/login/memLogin.do";
	}

	// 기업 회원가입 (암호화)
	@RequestMapping(value = "company/companySignUp.do", method = RequestMethod.POST)
	public String companyJoin(CMemberDto member) {
		// 암호화
		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		System.out.println("암호화 함 : " + member);
		cMember.signup(member);
		return "redirect:/login/company/comLogin.do";
	}

	/*
	 * @RequestMapping("mypage.do") public void mypage() {}
	 * 
	 * @RequestMapping("signform.do") public void signform() {}
	 * 
	 * @RequestMapping("signup.do") public String signup(AMemberDto user) {
	 * user.setPassword( new BCryptPasswordEncoder().encode(user.getPassword()) );
	 * service.signup(user); return "login/loginform"; }
	 * 
	 * @RequestMapping(value="test") public String test() { return "index2"; }
	 */
}