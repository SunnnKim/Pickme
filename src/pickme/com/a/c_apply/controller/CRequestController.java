package pickme.com.a.c_apply.controller;

import java.util.List;

import javax.json.JsonObject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.CMemberDto;
import model.CvCompanyDto;
import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageDto;
import model.MessageParam;
import pickme.com.a.c_apply.service.CRequestService;

@Controller
@RequestMapping(value = "/c_apply")
public class CRequestController {

	@Autowired
	CRequestService cApplyService;

	/*============== 이력서 열람 요청 리스트 ==============*/
	@RequestMapping(value = "getRequestList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String viewTest(Model model, HttpSession session, MessageParam param) {

		/* 기업 로그인 세션중 seq 저장 */
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq(); 
		param.setToSeq(c_seq);
		System.out.println(">>>>> getRequestList.do < c_seq > : " + c_seq);

		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		param.setStart(start);
		param.setEnd(end);

		System.out.println(">>>>> getRequestList.do < param > : " + param.toString());
		
		
		List<CvRequestDto> list = cApplyService.getRequestList(param);
	    System.out.println("이력서 열람요청 리스트 : " + list.toString());
		
		
		int totalRecordCount = cApplyService.getTotalRecordCount(param);
		System.out.println(">>>>> totalRecordCount:: " + totalRecordCount);

		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageNumber", pn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sKeyword", param.getsKeyword());
	    
	    model.addAttribute("requestList", list);
	 
		return "c_apply/requestList";
	}

	/*============== 관심인재 리스트 ==============*/
	@RequestMapping(value = "requestLike.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String requestLikeList(Model model, HttpSession session, MessageParam param) {
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		param.setToSeq(c_seq);
		System.out.println(">>>>> requestLike.do < c_seq > : " + c_seq);
		
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end);
		
		param.setStart(start);
		param.setEnd(end);
		System.out.println(">>>>> getRequestList.do < param > : " + param.toString());
		
		List<CvRequestDto> list = cApplyService.requestLike(param);
		System.out.println("관심 인재 : " + list.toString());
		
		int totalRecordCount = cApplyService.getLikeTotalRecordCount(param);
		System.out.println(">>>>> LiketotalRecordCount:: " + totalRecordCount);

		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageNumber", pn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sKeyword", param.getsKeyword());
		
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
	public int requestCancel(String cv_seq) {
		System.out.println("요청 취소 할 cv_seq : " + cv_seq);
		int count = cApplyService.requestCancel(cv_seq);

		return count;
	}
	
	
	/*============== 요청 승인시에 이력서 가져오기 ==============*/
	@ResponseBody
	@RequestMapping(value = "reqResumeOpen.do", method = { RequestMethod.POST })
	public CvCompanyDto reqResumeOpen(CvRequestDto dto, Model model, HttpSession session) {
		
		//기업 세션 SEQ 가져와 CV_COMPANY COMSEQ에 사용
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		dto.setComSeq(c_seq);
		System.out.println(">>>>> requestLike.do < c_seq > : " + c_seq);
		
			
		System.out.println(dto.getCvSeq());
		System.out.println(dto.getpEmail());
		
		
		CvCompanyDto reqResumeDto = cApplyService.reqResumeOpen(dto);
		
		
		System.out.println(" reqResumeDto.toString() >>>>>>>>>> "+reqResumeDto.toString());
		/*
		System.out.println(" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + resumeDto.toString());
		
		JSONObject jResume = new JSONObject();

		jResume.put("memEmail", resumeDto.getMemEmail());
		jResume.put("userName", resumeDto.getUserName());

		System.out.println(" jResume.toJSONString() : " + jResume.toJSONString());

		
		return jResume.toJSONString();
		*/ 
		return reqResumeDto; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
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
	*/
	
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
	
	
	
}
