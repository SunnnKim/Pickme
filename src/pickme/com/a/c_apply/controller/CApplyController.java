package pickme.com.a.c_apply.controller;

import java.util.List;

import javax.json.JsonObject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.CApplyDto;
import model.CvRequestDto;
import pickme.com.a.c_apply.service.CApplyService;

@Controller
@RequestMapping(value = "/c_apply")
public class CApplyController {
	
	@Autowired
	CApplyService cApplyService;
	
	@RequestMapping(value = "getRequestList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewTest(Model model) {
		
		List<CvRequestDto> list = cApplyService.getRequestList();
		
		System.out.println("이력서 열람요청 리스트 : "+ list.toString());
		
		model.addAttribute("requestList", list);
		return "c_apply/requestList";
	}
	
	@RequestMapping(value = "requestLikeList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String requestLikeList(Model model) {
		
		List<CvRequestDto> list = cApplyService.requestLikeList();
		
		System.out.println("관심 인재 : "+ list.toString());
		
		model.addAttribute("requestLikeList", list);
		return "c_apply/requestLikeList";
	}
	
	
	
	@RequestMapping(value = "getRequestList2.do", method= {RequestMethod.GET, RequestMethod.POST},produces = "application/json;charset=utf8")
	@ResponseBody
	public String viewTest222() {
		
		List<CvRequestDto> list = cApplyService.getRequestList();
		
		System.out.println("이력서 열람요청 리스트 : "+ list.toString());
		
		//model.addAttribute("requestList", list);
		
		JSONArray jList = new JSONArray();
		
		jList.add(list); 
		
		System.out.println(" jList.toJSONString() : " + jList.toJSONString());
		return jList.toJSONString();
		//return list.toString();
	}
	
	/*
	@RequestMapping(value = "requestDelete.do", method= {RequestMethod.POST})
	public boolean requestDelete (@RequestParam(value = "chbox[]") List<String> chArr, Cv_RequestDto seq) {
	
		
		for(String i : chArr) {
			
		}
	}
	*/
	
	
	/* 체크박스 삭제 */
	@ResponseBody
	@RequestMapping(value = "requestDelete.do", method= {RequestMethod.POST})
	  public int requestDelete (String checkRow){
		  //System.out.println("checkRow : " + checkRow);
		  int count = cApplyService.requestDelete(checkRow);
		  
		  return count;
	  }
	 
	
	
	
	
	
	@RequestMapping(value = "c_message.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String c_message() {
		return "c_apply/c_message";
	}
	
	
	
	
	
	
	@GetMapping(value="important_thing.do")
	public void star_msg(int a, HttpSession session) {
		/*
		 * //유저디티오 디티오 = (유저디티오)session.getAttribute("loginUser"); // String id =
		 * 디티오.getId();
		 * 
		 * recruitService.star_msg(a, id);
		 */
	}
}
