package pickme.com.a.c_mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.CMemberDto;
import pickme.com.a.c_mypage.service.CMypageService;

@Controller
@RequestMapping(value = "/c_member")
public class CMypageController {

	@Autowired
	CMypageService service;
	
	
	@RequestMapping(value = "test1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(CMemberDto dto, Model model) {
		CMemberDto list = service.dateTest(dto);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "index2";
	}
	
	
	// 기업 마이페이지 이동
	@RequestMapping(value = "goCMypage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goCMyPage(CMemberDto dto) {
		
		service.goCMypage(dto);
		
		return "c_mypage/myPage";
	}
	
	// 기업 수정페이지 이동
	@RequestMapping(value = "goUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goUpdate(CMemberDto dto) {
			
		service.goUpdate(dto);
		
		return "c_mypage/update";
	}
	
	// 기업회원 탈퇴페이지 이동
	@RequestMapping(value = "goWithdrawal.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goWithdrawal(CMemberDto dto) {
		
		service.goWithdrawal(dto);
		
		return "c_mypage/withdrawal";
	}
	
	// 결제 페이지 이동
	@RequestMapping(value = "goPayment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goPayment() {
		
		return "c/mypage/payment";
	}
	
	
	// 기업회원 탈퇴
	@RequestMapping(value = "withdrawal.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String withdrawal() throws Exception{
		
		
		
		return "main/main";
	}
	
}






