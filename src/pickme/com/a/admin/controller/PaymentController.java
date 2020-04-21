package pickme.com.a.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.PremierMemDto;
import model.PremierServiceDto;
import pickme.com.a.admin.service.PaymentService;

@RequestMapping(value="/admin/payment")
@Controller
public class PaymentController {

	@Autowired
	PaymentService service;
	
	// 유료서비스 페이지이동
	@RequestMapping(value="paidServiceView.do")
	public String paidServiceView(Model model) {
		// 유료멤버 데이터 
		List<PremierMemDto> memberList = service.getPremierMember();
		// 유료서비스 데이터 
		List<PremierServiceDto> serviceList = service.getPremierService();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("serviceList", serviceList);
		
		return "admin/payment/paidService";
	}
	
	// 서비스등록 페이지 이동
	@RequestMapping(value="writePaidService.do")
	public String writePaidService() {
		
		return "admin/payment/writePaidService";
		
	}

	
	// 결제 관리 페이지 이동
	@RequestMapping(value="managePayment.do")
	public String managePayment(Model model) {
		return "admin/payment/managePayment";
		
	}
}
