package pickme.com.a.recruit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.RecruitDto;
import pickme.com.a.recruit.service.RecruitService;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
	
	@Autowired
	RecruitService serv;
	
	
	@RequestMapping(value = "recInsert.do")
	public String recInsert(Model model) {
		//ref 불러오기
		int ref = serv.getRef();
		
		model.addAttribute("ref",ref);
		return "recruit/recInsert";
	}
	@RequestMapping(value = "recNow.do")
	public String recNow() {
		return "recruit/recNow";
	}
	@RequestMapping(value = "recPast.do")
	public String recPast() {
		return "recruit/recPast";
	}

	@ResponseBody
	@RequestMapping(value = "recInsertAf.do",method = RequestMethod.POST)
	public String recInsertAf(RecruitDto dto) {

		System.out.println(dto.toString());
	
		String msg="";
		
		
		 if(dto != null ) msg = "true"; 
		 else msg="false";
		  
		  
		return msg;
	}
	
	
	// @RequestParam(value = "originfile", required = false) MultipartFile fileload, HttpServletRequest req 
	
	
}
