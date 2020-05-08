package pickme.com.a.login.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.CMemberDto;
import model.NoticeDto;
import model.RecruitDto;
import pickme.com.a.login.service.LoginService;
import pickme.com.a.login.service.LoginServiceForCompany;
import pickme.com.a.util.MailUtil;

@RequestMapping("/login")
@Controller
public class LoginController {

	@Autowired
	LoginService aMember;	// 일반회원 
	@Autowired
	LoginServiceForCompany cMember;	// 기업회원 
	
	
	// 메인페이지
	@RequestMapping(value = "main.do")
	public String mainView( Model model, HttpSession session ) {
		
		if(session.getAttribute("logincompany") != null ) {
			return "main/comMain";
		}
		// 공지사항 데이터 
		List<NoticeDto> mainNoticeList = aMember.getMainNotice();
		// 메인 금주의 채용
		List<RecruitDto> recTopList = aMember.mainTopRec();
		// 메인 추천기업
		List<CMemberDto> companyList = aMember.mainTopCompany();
		
		model.addAttribute("mainNoticeList",mainNoticeList);
		model.addAttribute("recTopList",recTopList);
		model.addAttribute("companyList",companyList);
		
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

	// 가입 인증 페이지
	@RequestMapping(value = "validate.do")
	public String emailValidate( Model model ) {
	
		return "login/validate";
	}
	// 기업 - 사업자번호 미승인 페이지
	@RequestMapping(value = "upapproval.do")
	public String upapproval( Model model ) {
		
		return "login/upapproval";
	}
	
	// 인증메일 발송
	@ResponseBody
	@RequestMapping(value="sendValidateEmail.do", method=RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String sendValidateEmail(HttpSession session, String email ) {
		// 키코드 발급 
		UUID one = UUID.randomUUID();
		String keyCode = one.toString().split("-")[0];
		// 메일 쓰기 
		String subject = "[ Pick Me ] 회원가입 인증코드 안내 ";

		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'> PICK ME 이메일 인증코드입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "이메일 인증 페이지에서 인증코드 <strong>"; 
		msg += keyCode + "</strong> 를 입력해주세요.</div><br/>";
		// 메일 보내기 
		try {
			MailUtil.sendMail(email, subject, msg);
		} catch (Exception e) {
			e.getMessage();
		}
		return keyCode;
	}
	
	// 이메일 인증후데이터베이스 바꾸기 
	@RequestMapping(value="accountValidate.do", method=RequestMethod.POST)
	public String accountValidate( String memberType, String email, HttpSession session) {
		if( memberType.equalsIgnoreCase("amember") ) {
			// 일반회원 계정 
			aMember.emailValidateA(new AMemberDto(email));
			// session 갱신
			AMemberDto loginuser = aMember.updateSession(email);
			session.setAttribute("loginuser", loginuser);
			
		}else if( memberType.equalsIgnoreCase("cmember") ) {
			// 기업회원 계정
			cMember.emailValidateC(new CMemberDto(email));
			// session 갱신
			CMemberDto logincompany = cMember.updateSession(email);
			session.setAttribute("logincompany", logincompany);
		}
		
		return "redirect:/login/main.do";
		
	}
	
	
	// 일반 비밀번호 변경 전 비밀번호 체크 
	@ResponseBody
	@RequestMapping(value="checkPasswordA.do", method=RequestMethod.POST)
	public String checkPasswordA ( AMemberDto memberDto ) {
		boolean success = aMember.checkPasswordA(memberDto);
		return success + "";
	}
	
	// 기업 비밀번호 변경 전 비밀번호 체크 
	@ResponseBody
	@RequestMapping(value="checkPasswordC.do", method=RequestMethod.POST)
	public String changePwdView ( CMemberDto companyDto ) {
		boolean success = cMember.checkPasswordC(companyDto);
		return success + "";
	}
	
	// 일반 비밀번호 변경하기
	@RequestMapping(value="changePasswordA.do", method=RequestMethod.POST)
	public String changePasswordA(AMemberDto memberDto, Model model) {
		System.out.println(memberDto);
		memberDto.setPassword(new BCryptPasswordEncoder().encode(memberDto.getPassword()));
		boolean success = aMember.updatePasswordA(memberDto);
		
		if(success) {
			return "redirect:/a_mypage/profile.do";
		}
		// 실패시 
		return "redirect:/a_mypage/changePassword.do";
	}
	
	// 기업 비밀번호 변경하기
	@RequestMapping(value="changePasswordC.do", method=RequestMethod.POST)
	public String changePasswordC(CMemberDto companyDto, Model model) {
		System.out.println(companyDto);
		companyDto.setPassword(new BCryptPasswordEncoder().encode(companyDto.getPassword()));
		boolean success = cMember.updatePasswordC(companyDto);
		if(success) {
			return "redirect:/c_mypage/goUpdate.do";
		}
		// 실패시 
		return "redirect:/c_mypage/update.do";
	}
	
	
	// 일반회원 탈퇴신청
	@RequestMapping(value="memberWithdrawal.do", method=RequestMethod.POST)
	public String memberWithdrawal( HttpSession session ) {
		int seq = ((AMemberDto)session.getAttribute("loginuser")).getSeq();
		boolean success = aMember.withdrawMemberA(seq);
		if(success) {
			return "redirect:/login/logout.do";
		}
		return "redirect:/a_mypage/withdrawal.do";
	}
	// 기업회원 탈퇴신청
	@RequestMapping(value="companyWithdrawal.do", method=RequestMethod.POST)
	public String companyWithdrawal( HttpSession session ) {
		int seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		boolean success = cMember.withdrawMemberC(seq);
		if(success) {
			return "redirect:/login/company/logout.do";
		}
		return "redirect:/c_mypage/goWithdrawal.do";
	}
	
	// @@@@@@@@@@@@@@@
	
	
	// 일반회원 이메일/비번 찾기 페이지 
	@RequestMapping(value="findEmailPwdA.do")
	public String findEmailPwdA() {
		return "login/memFindEmailPwd";
	}
	
	// 일반 이메일 찾기 
	@ResponseBody
	@RequestMapping(value="getLostEmailA.do", method=RequestMethod.POST)
	public String getLostEmailA( AMemberDto dto ) {
		System.out.println(dto);
		boolean success = aMember.getLostEmailA(dto);
		return success + "";
	}
	
	// 일반 임시 비밀번호 찾기  
	@ResponseBody
	@RequestMapping(value="sendPasswordEmail.do", method=RequestMethod.POST)
	public String getLostPasswordA ( AMemberDto dto ) {
		System.out.println(dto);
		boolean emailExist = aMember.getLostEmailA2(dto);
		System.out.println("emailExist : " + emailExist);
		if( !emailExist ) return "falseEmail";
		
		// 키코드 발급 
		UUID one = UUID.randomUUID();
		String keyCode = one.toString().split("-")[0];
		// 메일 쓰기 
		String subject = "[ Pick Me ] 임시 비밀번호 인증코드 안내 ";
		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'> PICK ME 임시 비밀번호 인증코드입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "임시 비밀번호 인증 페이지에서 인증코드 <strong>"; 
		msg += keyCode + "</strong> 를 입력해주세요.</div><br/>";
		// 메일 보내기 
		try {
			MailUtil.sendMail( dto.getEmail(), subject, msg);
		} catch (Exception e) {
			e.getMessage();
			return "false";
		}
		return keyCode;
		
	}
	
	
	// 일반회원 인증번호로 비밀번호 변경 페이지 가기 
	@RequestMapping (value="memChangePwd.do", method=RequestMethod.POST)
	public String memChangePwd( Model model, String emailCode, String memberEmail ) {
		model.addAttribute("emailCode", emailCode);
		model.addAttribute("memberEmail", memberEmail);
		return "login/memChangePwd";
	}
	
	// 일반회원 인증번호로 비밀번호 변경하기
	@RequestMapping (value="changePwdWithCode.do", method=RequestMethod.POST)
	public String changePwdWithCode( Model model, AMemberDto dto ) {
		
		dto.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));
		
		boolean success = aMember.changePwdWithCodeA(dto);
		if(success) return "redirect:/login/memLogin.do";
		
		return "redirect:/login/findEmailPwdA.do";
	}

	// 기업
	// 기업회원 이메일/비번 찾기 페이지 
	@RequestMapping(value="company/findEmailPwdC.do")
	public String findEmailPwdC() {
		return "login/company/comFindEmailPwd";
	}
	// 기업 이메일 찾기 
	@ResponseBody
	@RequestMapping(value="company/getLostEmailC.do", method=RequestMethod.POST)
	public String getLostEmailC( CMemberDto dto ) {
		System.out.println(dto);
		boolean success = cMember.getLostEmailC(dto);
		return success + "";
	}
	
	// 기업 임시 비밀번호 찾기  
	@ResponseBody
	@RequestMapping(value="company/getLostPasswordC.do", method=RequestMethod.POST)
	public String getLostPasswordC ( CMemberDto dto ) {
		System.out.println(dto);
		boolean emailExist = cMember.getLostEmailC2(dto);
		System.out.println("emailExist : " + emailExist);
		if( !emailExist ) return "falseEmail";
		
		// 키코드 발급 
		UUID one = UUID.randomUUID();
		String keyCode = one.toString().split("-")[0];
		// 메일 쓰기 
		String subject = "[ Pick Me ] 임시 비밀번호 인증코드 안내 ";
		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'> PICK ME 임시 비밀번호 인증코드입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "임시 비밀번호 인증 페이지에서 인증코드 <strong>"; 
		msg += keyCode + "</strong> 를 입력해주세요.</div><br/>";
		// 메일 보내기 
		try {
			MailUtil.sendMail( dto.getEmail(), subject, msg);
		} catch (Exception e) {
			e.getMessage();
			return "false";
		}
		return keyCode;
	}
	
	
	// 일반회원 인증번호로 비밀번호 변경 페이지 가기 
	@RequestMapping (value="company/comChangePwd.do", method=RequestMethod.POST)
	public String comChangePwd( Model model, String emailCode, String memberEmail ) {
		model.addAttribute("emailCode", emailCode);
		model.addAttribute("memberEmail", memberEmail);
		return "login/company/comChangePwd";
	}
	
	// 일반회원 인증번호로 비밀번호 변경하기
	@RequestMapping (value="company/changePwdWithCode.do", method=RequestMethod.POST)
	public String changePwdWithCodeC( Model model, CMemberDto dto ) {
		
		dto.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));
		
		boolean success = cMember.changePwdWithCodeC(dto);
		if(success) return "redirect:/login/company/comLogin.do";
		
		return "redirect:/login/company/findEmailPwdC.do";
	}
	
	// 기업 사업자등록번호 변경하기
	@ResponseBody
	@RequestMapping(value = "company/changeCompanyNumber.do", method=RequestMethod.POST)
	public boolean changeCompanyNumber(CMemberDto company) {
		
		System.out.println(company);
		return cMember.changeCompanyNumber(company);
	}
	
	
}