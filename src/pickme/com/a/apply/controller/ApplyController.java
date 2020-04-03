package pickme.com.a.apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("apply")
public class ApplyController {

	@RequestMapping(value="curAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCurAList() {
		
	
		return "apply/curAList";
	}
	
	@RequestMapping(value="pastAList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getPastAList() {
		
		return "apply/pastAList";
	}
	
}
