package pickme.com.a.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 일반회원 복원하기
	@ResponseBody
	@RequestMapping(value="recoverMemberA.do", method=RequestMethod.POST)
	public boolean recoverMemberA(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.recoverMemberA(seqList);
		
		return success;
	}
	// 일반회원 탈퇴처리하기
	@ResponseBody
	@RequestMapping(value="updateDelMemberA.do", method=RequestMethod.POST)
	public boolean updateDelMemberA(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.updateDelMemberA(seqList);
		
		return success;
	}
	// 일반회원 - 탈퇴관리페이지 가기 
	@RequestMapping(value = "withdrawal.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String withdrawal( Model model) {
		List<AMemberDto> memberList = service.getWithdrawMemberA();
		model.addAttribute("memberList", memberList);
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
	
	@RequestMapping(value = "comApproval.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String comApproval( Model model ) {
		// 미승인 데이터 불러오기
		List<CMemberDto> companyList = service.getUnapprovalList();
		model.addAttribute("companyList", companyList);
		return "admin/companyApproval";
	}
	
	// 기업회원 가입승인하기
	@ResponseBody
	@RequestMapping(value="approveCompany.do",method=RequestMethod.POST)
	public boolean approveCompany ( @RequestParam("seqList[]") List<Integer> seqList ) {
		System.out.println(seqList);
		return service.approveCompany(seqList);
	}
	// 기업회원 가입승인 취소하기
	@ResponseBody
	@RequestMapping(value="unapproveCompany.do",method=RequestMethod.POST)
	public boolean unapproveCompany ( @RequestParam("seqList[]") List<Integer> seqList ) {
		System.out.println(seqList);
		return service.unapproveCompany(seqList);
	}
	
	
	
	
	// 기업 탈퇴관리 페이지가기  
	@RequestMapping(value = "comWithdrawal.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String comWithdrawal( Model model) {
		List<CMemberDto> memberList = service.getWithdrawMemberC();
		model.addAttribute("memberList", memberList);
		return "admin/companyWithdrawal";
	}
	
	// 일반회원 탈퇴처리하기
	@ResponseBody
	@RequestMapping(value="updateDelMemberC.do", method=RequestMethod.POST)
	public boolean updateDelMemberC(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.updateDelMemberC(seqList);
		
		return success;
	}
	
	// 기업회원 탈퇴 복원하기
	@ResponseBody
	@RequestMapping(value="recoverMemberC.do", method=RequestMethod.POST)
	public boolean recoverMemberC(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		boolean success = service.recoverMemberC(seqList);
		return success;
	}
	
}
