package pickme.com.a.c_apply.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
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
import model.AwardsEtcDto;
import model.CMemberDto;
import model.CareerDto;
import model.CvCompanyDto;
import model.CvRecruitDto;
import model.CvRequestDto;
import model.EducationDto;
import model.FavoriteDto;
import model.LanguageDto;
import model.LinkDto;
import model.MessageDto;
import model.MessageParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;
import pickme.com.a.c_apply.service.CApplyService;
import pickme.com.a.c_apply.service.CRequestService;

@Controller
@RequestMapping(value = "/c_apply")
public class CRequestController {

	@Autowired
	CRequestService cApplyService;
	@Autowired
	CApplyService cApply;

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
	
	
	@ResponseBody
	@RequestMapping(value = "getaMemberProfile.do", method = {RequestMethod.POST})
	public Map<String, Object> getaMemberProfile(String seq){
		
		System.out.println("getaMemberProfile seq : " + seq);
		
		Map<String, Object> data = new HashMap<>(); 
		AMemberDto dto = cApplyService.getaMemberProfile(seq);
		
		System.out.println(":::::::::::::::::::" + dto.toString());
		
		data.put("AMember", dto); 
		
		
		return data;
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
	
	
	
	
	
	
	// 이력서 열람 버튼 Ajax file인지 아닌지 판별
		@ResponseBody
		@RequestMapping(value = "reResumeOpen.do", method = { RequestMethod.POST })
		public Map<String, Object> apResumeOpen(int cvSeq, HttpSession session) {
			//System.out.println("memSeq : " + memSeq );
			
			// 열람 확인 DB 저장
			boolean b = cApplyService.setResumeOpen(cvSeq);
			System.out.println("열람요청 페이지 열람 확인 DB 저장 : " + b);
			ResumeFileDto dto = cApply.findResumeFile(cvSeq);
					
			
			// 시퀀스로 RESUME_FILE_AFTER 조회
			// 리턴이 null 이면 "cant find file"
			
			// null이 아니면 모든 내용 리턴
			
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("fileDto", dto);
			
			
			
			//CvRecruitDto apResumeDto = cApplyService.apResumeOpen(cvSeq);
			//System.out.println(apResumeDto.toString());
			System.out.println("왜 안되니 : " + map);
			return map;
			
		}
	
	
		@RequestMapping(value = "reOpenResumeDetail.do",  method = { RequestMethod.POST, RequestMethod.GET })
		public String openResumeDetail(int seq, Model model) {
			
			System.out.println("openResume : " + seq);
			
			/* RESUME_AFTER 이력서 가져오기 */
			ResumeAfterDto dto = cApply.getResumeAfter(seq);
			System.out.println("openResumeDetail : " +dto.toString());
			
			int rsmseq = dto.getSeq();
			/* CAREER_AFTER 경력 가져오기 */
			List<CareerDto> careerList = cApply.getCareerAfter(rsmseq);
					
			/* EDUCATION_AFTER 학력 가져오기 */
			List<EducationDto> educationList = cApply.getEducationAfter(rsmseq);
			
			/* AWARDSETC_AFTER 수상 및 기타 가져오기 */
			List<AwardsEtcDto> awardsList = cApply.getAwardsAfter(rsmseq);
			
			/* LANGUAGE_AFTER 외국어 가져오기 */
			List<LanguageDto> languageList = cApply.getLanguageAfter(rsmseq);
			
			/* LINK_AFTER 링크 가져오기 */
			List<LinkDto> linkList = cApply.getLinkAfter(rsmseq);
			
			
			model.addAttribute("dto", dto);
			model.addAttribute("careerList", careerList);
			model.addAttribute("educationList", educationList);
			model.addAttribute("awardsList", awardsList);
			model.addAttribute("languageList", languageList);
			model.addAttribute("linkList", linkList);
			
			return "c_apply/openResumeDetail";
		}
		
	
	
		@RequestMapping(value = "reResumeDownLoad.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String resumeDownLoad(String filename, HttpServletRequest request, Model model) {
				// download 경로
				// tomcat
				String fupload = request.getServletContext().getRealPath("/upload/resume");
				System.out.println("Download filename: " + filename);
				File downloadFile = new File(fupload + "/" + filename);
				
				model.addAttribute("downloadFile", downloadFile);
				
				return "downloadView";	// 파일만 다운로드
			
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
