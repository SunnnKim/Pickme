package pickme.com.a.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.AMemberDto;
import model.AdminDto;
import model.CMemberDto;
import pickme.com.a.admin.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService service;
	
	// 관리자 로그인 뷰
	@RequestMapping(value="login.do")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	// 관리자 로그인
	@RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
	public String loginCheck( AdminDto dto, Model model) {
		
		AdminDto admin = service.loginCheck(dto);	// 로그인 체크 및 정보 가져오기 
		// 로그인 실패시 처리
		if(admin == null ) return "redirect:/admin/login.do?fail=true";
		return "redirect:/admin/adminMember.do";
	}
	// 일반회원 관리 
	@RequestMapping(value = "adminMember.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String adminMember(Model model) {
		// 일반회원 데이터 모두 가져오기
		List<AMemberDto> list = service.aMemberAll();
		int newMember = service.countNewAMember();
		int aMemberAll = service.countAmember();
		int cMemberAll = service.countCmember();
		model.addAttribute("list", list);	// 전체 회원리스트 
		model.addAttribute("newMember", newMember);		// 새로운 가입자 수 
		model.addAttribute("aMemberAll", aMemberAll);	// 일반회원 수
		model.addAttribute("cMemberAll", cMemberAll);	// 기업회원 수
		return "admin/adminMember";
	}
	// 일반회원 - 탈퇴관리 
	@RequestMapping(value = "withdrawal.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String withdrawal( Model model) {
		return "admin/adminMemberWithdrawal";
	}
	
	// 기업 회원관리
	@RequestMapping(value = "adminCompany.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String adminCompany( Model model ) {
		// 기업회원 데이터 모두 가져오기
		List<CMemberDto> list = service.cMemberAll();
		int newMember = service.countNewCMember();
		int aMemberAll = service.countAmember();
		int cMemberAll = service.countCmember();
		model.addAttribute("list", list);	// 전체 회원리스트 
		model.addAttribute("newMember", newMember);		// 새로운 가입자 수 
		model.addAttribute("aMemberAll", aMemberAll);	// 일반회원 수
		model.addAttribute("cMemberAll", cMemberAll);	// 기업회원 수
		return "admin/companyMember";
	}
	
	// 탈퇴관리 
	@RequestMapping(value = "comWithdrawal.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String comWithdrawal( Model model) {
		return "admin/companyWithdrawal";
	}
	
}
