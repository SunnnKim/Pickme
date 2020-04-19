package pickme.com.a.c_mypage.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.CMemberDto;
import pickme.com.a.c_mypage.service.CMypageService;

@Controller
@RequestMapping(value = "/c_mypage")
public class CMypageController {

	@Autowired
	CMypageService service;
	
	
	// 슬라이드 테스트용
	@RequestMapping(value = "slide.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String slide() {
		return "c_mypage/slideTest";
	}
	
	
	@RequestMapping(value = "test1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(CMemberDto dto, Model model) {
		CMemberDto list = service.dateTest(dto);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "index2";
	}
	
	// 주소 불러오기
	@RequestMapping(value = "showAddress.do", method = {RequestMethod.GET, RequestMethod.POST})
	public CMemberDto loadAddress(CMemberDto dto, Model model) {
		CMemberDto address = service.showAddress(dto);
		model.addAttribute("address", address);
		System.out.println(address.toString());
		return address;
	}
	
	// 연락처 불러오기
	@RequestMapping(value = "showTel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public CMemberDto showTel(CMemberDto dto, Model model) {
		CMemberDto tel = service.showTel(dto);
		model.addAttribute("tel", tel);
		System.out.println(tel.toString());
		return tel;
	}
	
	
	// 기업 마이페이지 이동
	@RequestMapping(value = "goCMypage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goCMyPage(Model model, HttpSession session) {
		System.out.println("test go ");
		// 기업 고유 시퀀스 
		int seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq() ;
		CMemberDto cMember = service.select(seq);
		model.addAttribute("cMember", cMember);
		return "c_mypage/myPage";
	}
	
	// 기업 비밀번호 변경 페이지 이동
	@RequestMapping(value = "goPasswordUpdate.do", method = {RequestMethod.GET})
	public String goPasswordUpdate() {
		
		return "c_mypage/passwordUpdate";
	}
	
	// 기업 수정페이지 이동
	@RequestMapping(value = "goUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goUpdate(CMemberDto dto, Model model, HttpSession session) {
			
		CMemberDto company = (CMemberDto)session.getAttribute("logincompany");
		
		int seq = company.getSeq();
		
		CMemberDto dtoo = service.select(seq);
		
		model.addAttribute("dto", dtoo);
		
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
		
		return "c_mypage/payment";
	}
	
	
	// 기업 정보 수정 
	@RequestMapping(value = "update.do", method = {RequestMethod.POST})
	public String update(CMemberDto dto, Model model, String oldPassword, String newPassword) throws Exception {
		
		service.update(dto);
		
		return "c_mypage/update";
	}
	
	
	
	
	
	// 
	private String saveFile(MultipartFile file) {
		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		System.out.println("저장된 로고 이름 = {}" + saveName);
		
		// 저장할 File 객체를 생성
//		File saveFile = new File(UPLOAD_PATH, saveName);
		
		return "";
	}
	
	
	
	// 로고 업로드
	@RequestMapping(value = "logoUpload.do", method = {RequestMethod.POST})
	public void logoUpload(MultipartFile uploadFile) {
		System.out.println("로고 업로드");
		System.out.println("로고 이름 = " + uploadFile.getOriginalFilename());
		System.out.println("로고 크기 = " + uploadFile.getSize());
		
		saveFile(uploadFile);
	}
}






