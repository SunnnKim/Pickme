package pickme.com.a.apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/apply")
public class CvRequestController {
	
	
	@RequestMapping (value="getCurCvReq.do", method=RequestMethod.POST)
	public String getcurCvReq() {
		
		
		return "apply/curCvReq";
	}
	
	@RequestMapping(value="getPastCvReq.do", method=RequestMethod.POST)
	public String getPastCvReq() {
		
		return "apply/pastCvReq";
	}
	
	@RequestMapping(value="cvReqResp", method=RequestMethod.POST)
	public String cvReqResp() {
		
		return "redirect:apply/getCurCvReq.do";
	}

	
}
