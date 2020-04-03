package pickme.com.a.apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/apply")
public class CvRequestController {
	
	
	@RequestMapping (value="curCvReq.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getcurCvReq() {
		
		
		return "apply/curCvReq";
	}
	
	@RequestMapping(value="pastCvReq.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getPastCvReq() {
		System.out.println("pastCvReq");
		return "apply/pastCvReq";
	}
	
	@RequestMapping(value="cvReqResp.do", method={RequestMethod.GET, RequestMethod.POST})
	public String cvReqResp() {
		// ajax로 처리할지도 몰라유~~~
		return "redirect:apply/curCvReq.do";
	}

	
}
