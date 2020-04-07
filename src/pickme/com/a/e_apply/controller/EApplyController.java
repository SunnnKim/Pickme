package pickme.com.a.e_apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("e_apply")
public class EApplyController {

	@RequestMapping(value="curAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCurAList() {
		
	
		return "apply/curAList";
	}
	
	@RequestMapping(value="pastAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getPastAList() {
		
		return "apply/pastAList";
	}
	
}
