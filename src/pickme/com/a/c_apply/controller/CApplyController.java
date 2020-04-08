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
import model.FavoriteDto;
import pickme.com.a.c_apply.service.CApplyService;

@Controller
@RequestMapping(value = "/c_apply")
public class CApplyController {

	@Autowired
	CApplyService cApplyService;

	/*============== 이력서 열람 요청 리스트 ==============*/
	@RequestMapping(value = "getRequestList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String viewTest(Model model) {

		List<CvRequestDto> list = cApplyService.getRequestList();
		System.out.println("이력서 열람요청 리스트 : " + list.toString());
		model.addAttribute("requestList", list);
		return "c_apply/requestList";
	}

	/*============== 관심인해 리스트 ==============*/
	@RequestMapping(value = "requestLike.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String requestLikeList(Model model) {

		List<CvRequestDto> list = cApplyService.requestLike();
		System.out.println("관심 인재 : " + list.toString());
		model.addAttribute("requestLike", list);

		return "c_apply/requestLike";
	}

	/*============== 관심 인재 추가 ==============*/
	@ResponseBody
	@RequestMapping(value = "addLike.do", method = RequestMethod.POST)
	public boolean addLike(FavoriteDto dto) {
		// System.out.println("seq : " + seq + " email : " +email);
		System.out.println(dto.toString());

		boolean b = cApplyService.addLike(dto);
		// System.out.println("addLike boolean b : " + b);

		return b;
	}

	/*============== 관심 인재 해제 ==============*/
	@ResponseBody
	@RequestMapping(value = "delLike.do", method = RequestMethod.POST)
	public boolean delLike(FavoriteDto dto) {
		// System.out.println("seq : " + seq + " email : " +email);
		System.out.println(dto.toString());

		boolean b = cApplyService.delLike(dto);
		// System.out.println("addLike boolean b : " + b);

		return b;
	}

	/*============== 체크박스 삭제 ==============*/
	@ResponseBody
	@RequestMapping(value = "requestDelete.do", method = { RequestMethod.POST })
	public int requestDelete(String checkRow) {
		// System.out.println("checkRow : " + checkRow);
		int count = cApplyService.requestDelete(checkRow);

		return count;
	}

	/*============== 열람 요청 취소  ==============*/
	@ResponseBody
	@RequestMapping(value = "requestCancel.do", method = { RequestMethod.POST })
	public boolean requestCancel(String cv_seq) {
		System.out.println("요청 취소 할 cv_seq : " + cv_seq);
		boolean b = cApplyService.requestCancel(cv_seq);

		return b;
	}
	
	
	/*============== 메세지함 호출 ==============*/
	@RequestMapping(value = "c_message.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String c_message() {
		return "c_apply/c_message";
	}

	
	
	
	
	@RequestMapping(value = "getRequestList2.do", method = { RequestMethod.GET,	RequestMethod.POST }, produces = "application/json;charset=utf8")
	@ResponseBody
	public String viewTest222() {

		List<CvRequestDto> list = cApplyService.getRequestList();

		System.out.println("이력서 열람요청 리스트 : " + list.toString());

		// model.addAttribute("requestList", list);

		JSONArray jList = new JSONArray();

		jList.add(list);

		System.out.println(" jList.toJSONString() : " + jList.toJSONString());
		return jList.toJSONString();
		// return list.toString();
	}

	/*
	 * @RequestMapping(value = "requestDelete.do", method= {RequestMethod.POST})
	 * public boolean requestDelete (@RequestParam(value = "chbox[]") List<String>
	 * chArr, Cv_RequestDto seq) {
	 * 
	 * 
	 * for(String i : chArr) {
	 * 
	 * } }
	 */
	
	
	
	
	

	@GetMapping(value = "important_thing.do")
	public void star_msg(int a, HttpSession session) {
		/*
		 * //유저디티오 디티오 = (유저디티오)session.getAttribute("loginUser"); // String id =
		 * 디티오.getId();
		 * 
		 * recruitService.star_msg(a, id);
		 */
	}
}
